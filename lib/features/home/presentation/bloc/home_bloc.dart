import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningo/features/home/domain/entites/unit_progress_entity.dart';
import 'package:learningo/features/home/domain/usecases/get_chapters_usecase.dart';
import 'package:learningo/features/home/presentation/bloc/home_event.dart';
import 'package:learningo/features/home/presentation/bloc/home_state.dart';

/// Business logic component managing state for the Home feature.
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetChaptersUseCase getChaptersUseCase;

  HomeBloc({required this.getChaptersUseCase})
      : super(const HomeInitialState()) {
    on<LoadHomeDataEvent>(_onLoadHomeData);
    on<UpdateMonthProgressEvent>(_onUpdateMonthProgress);
  }

  Future<void> _onLoadHomeData(
    LoadHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeLoadingState());
    final chapters = await getChaptersUseCase();

    final progressMap = <String, UnitProgressEntity>{};
    if (chapters.isNotEmpty) {
      final firstChapter = chapters.first;
      for (int i = 0; i < firstChapter.units.length; i++) {
        final unitName = firstChapter.units[i];
        // Initial state is 0% progress, unit 0 active, subsequent units locked
        progressMap[unitName] = UnitProgressEntity(
          unitName: unitName,
          unitIndex: i,
          progress: 0.0,
          conceptsCount: 10,
          isCompleted: false,
          isActive: (i == 0),
        );
      }
    }

    emit(HomeDataLoadedState(
      chapters: chapters,
      unitProgressMap: progressMap,
    ));
  }

  void _onUpdateMonthProgress(
    UpdateMonthProgressEvent event,
    Emitter<HomeState> emit,
  ) {
    if (state is! HomeDataLoadedState) return;
    final currentState = state as HomeDataLoadedState;

    final updatedMap =
        Map<String, UnitProgressEntity>.from(currentState.unitProgressMap);

    String? targetKey;
    if (event.unitName != null && updatedMap.containsKey(event.unitName)) {
      targetKey = event.unitName;
    } else if (event.unitIndex != null) {
      for (final entry in updatedMap.entries) {
        if (entry.value.unitIndex == event.unitIndex) {
          targetKey = entry.key;
          break;
        }
      }
    }

    if (targetKey != null) {
      final existing = updatedMap[targetKey]!;
      final totalConcepts = event.conceptsCount ?? existing.conceptsCount ?? 10;
      int newCompleted = existing.completedConcepts;
      if (event.completedConcepts != null) {
        newCompleted = event.completedConcepts! > existing.completedConcepts
            ? event.completedConcepts!
            : existing.completedConcepts;
      }
      final rawProgress = event.progress ??
          (totalConcepts > 0 ? (newCompleted / totalConcepts) : existing.progress);
      final clampedProgress = rawProgress.clamp(0.0, 1.0);
      final isCompleted = (event.isCompleted ?? (clampedProgress >= 1.0)) &&
          clampedProgress >= 1.0;
      final isActive = event.isActive ?? (clampedProgress > 0 && !isCompleted);
      final lastIndex = event.lastQuestionIndex ?? existing.lastQuestionIndex;

      updatedMap[targetKey] = existing.copyWith(
        progress: clampedProgress,
        conceptsCount: totalConcepts,
        completedConcepts: newCompleted,
        lastQuestionIndex: lastIndex,
        isCompleted: isCompleted,
        isActive: isActive,
      );

      // When a unit reaches 100% completion, automatically unlock and activate the next unit
      if (isCompleted) {
        final nextIndex = existing.unitIndex + 1;
        for (final entry in updatedMap.entries) {
          if (entry.value.unitIndex == nextIndex && !entry.value.isCompleted) {
            updatedMap[entry.key] = entry.value.copyWith(isActive: true);
            break;
          }
        }
      }
    } else if (event.unitName != null) {
      final totalConcepts = event.conceptsCount ?? 10;
      final newCompleted = event.completedConcepts ?? 0;
      final rawProgress = event.progress ??
          (totalConcepts > 0 ? (newCompleted / totalConcepts) : 0.0);
      final clampedProgress = rawProgress.clamp(0.0, 1.0);
      final isCompleted = (event.isCompleted ?? (clampedProgress >= 1.0)) &&
          clampedProgress >= 1.0;
      updatedMap[event.unitName!] = UnitProgressEntity(
        unitName: event.unitName!,
        unitIndex: event.unitIndex ?? updatedMap.length,
        progress: clampedProgress,
        conceptsCount: totalConcepts,
        completedConcepts: newCompleted,
        lastQuestionIndex: event.lastQuestionIndex ?? 0,
        isCompleted: isCompleted,
        isActive: event.isActive ?? (clampedProgress > 0 && !isCompleted),
      );
    }

    emit(currentState.copyWith(unitProgressMap: updatedMap));
  }
}

import 'package:flutter_test/flutter_test.dart';
import 'package:learningo/features/home/domain/entites/chapter_entity.dart';
import 'package:learningo/features/home/domain/repositories/home_repository.dart';
import 'package:learningo/features/home/domain/usecases/get_chapters_usecase.dart';
import 'package:learningo/features/home/presentation/bloc/home_bloc.dart';
import 'package:learningo/features/home/presentation/bloc/home_event.dart';
import 'package:learningo/features/home/presentation/bloc/home_state.dart';

class MockHomeRepository implements HomeRepository {
  final List<ChapterEntity> mockChapters;
  MockHomeRepository(this.mockChapters);

  @override
  Future<List<ChapterEntity>> getChapters() async => mockChapters;
}

void main() {
  group('HomeBloc Dynamic Progress Tests', () {
    late List<ChapterEntity> testChapters;
    late MockHomeRepository mockRepository;
    late GetChaptersUseCase getChaptersUseCase;

    setUp(() {
      testChapters = [
        const ChapterEntity(
          id: 1,
          index: 1,
          nameEn: 'Important Days',
          nameHi: 'दिवस',
          units: ['January', 'February', 'March', 'April', 'May'],
        ),
      ];
      mockRepository = MockHomeRepository(testChapters);
      getChaptersUseCase = GetChaptersUseCase(mockRepository);
    });

    test('initial state is HomeInitialState', () {
      final bloc = HomeBloc(getChaptersUseCase: getChaptersUseCase);
      expect(bloc.state, isA<HomeInitialState>());
      bloc.close();
    });

    test('LoadHomeDataEvent initializes dynamic 0% progress and emits HomeDataLoadedState', () async {
      final bloc = HomeBloc(getChaptersUseCase: getChaptersUseCase);

      bloc.add(const LoadHomeDataEvent());

      await expectLater(
        bloc.stream,
        emitsInOrder([
          isA<HomeLoadingState>(),
          predicate<HomeDataLoadedState>((state) {
            final jan = state.unitProgressMap['January'];
            final feb = state.unitProgressMap['February'];
            return state.chapters.length == 1 &&
                jan != null &&
                jan.progress == 0.0 &&
                jan.isActive &&
                !jan.isCompleted &&
                feb != null &&
                feb.progress == 0.0 &&
                !feb.isActive &&
                state.completedUnitsCount == 0 &&
                state.completionPercentageText == '0%';
          }),
        ]),
      );

      await bloc.close();
    });

    test('UpdateMonthProgressEvent updates progress dynamically and unlocks next unit when completed', () async {
      final bloc = HomeBloc(getChaptersUseCase: getChaptersUseCase);

      bloc.add(const LoadHomeDataEvent());
      await expectLater(
        bloc.stream,
        emitsThrough(isA<HomeDataLoadedState>()),
      );

      // 1. Update January to 50%
      bloc.add(const UpdateMonthProgressEvent(
        unitName: 'January',
        progress: 0.50,
      ));

      await expectLater(
        bloc.stream,
        emits(predicate<HomeDataLoadedState>((state) {
          final jan = state.unitProgressMap['January'];
          return jan != null &&
              jan.progress == 0.50 &&
              jan.isActive &&
              jan.masteryStatusText == '50% mastered';
        })),
      );

      // 2. Complete January (100%), which should unlock and activate February
      bloc.add(const UpdateMonthProgressEvent(
        unitIndex: 0,
        progress: 1.0,
        isCompleted: true,
      ));

      await expectLater(
        bloc.stream,
        emits(predicate<HomeDataLoadedState>((state) {
          final jan = state.unitProgressMap['January'];
          final feb = state.unitProgressMap['February'];
          return jan != null &&
              jan.progress == 1.0 &&
              jan.isCompleted &&
              jan.masteryStatusText == '100% mastered' &&
              feb != null &&
              feb.isActive &&
              state.completedUnitsCount == 1;
        })),
      );

      await bloc.close();
    });
  });
}

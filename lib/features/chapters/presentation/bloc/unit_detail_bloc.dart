import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningo/features/chapters/domain/usecases/get_unit_detail_usecase.dart';
import 'package:learningo/features/chapters/presentation/bloc/unit_detail_event.dart';
import 'package:learningo/features/chapters/presentation/bloc/unit_detail_state.dart';

/// BLoC managing the state for the Unit Detail screen.
class UnitDetailBloc extends Bloc<UnitDetailEvent, UnitDetailState> {
  final GetUnitDetailUseCase getUnitDetailUseCase;

  UnitDetailBloc({required this.getUnitDetailUseCase})
      : super(const UnitDetailInitialState()) {
    on<LoadUnitDetailEvent>(_onLoadUnitDetail);
    on<ToggleViewModeEvent>(_onToggleViewMode);
  }

  Future<void> _onLoadUnitDetail(
    LoadUnitDetailEvent event,
    Emitter<UnitDetailState> emit,
  ) async {
    emit(const UnitDetailLoadingState());
    final unitDetail = await getUnitDetailUseCase(event.unitId);
    emit(UnitDetailLoadedState(unitDetail: unitDetail));
  }

  void _onToggleViewMode(
    ToggleViewModeEvent event,
    Emitter<UnitDetailState> emit,
  ) {
    if (state is UnitDetailLoadedState) {
      final currentState = state as UnitDetailLoadedState;
      emit(currentState.copyWith(isIndexView: event.isIndexView));
    }
  }
}

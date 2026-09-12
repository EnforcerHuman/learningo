import 'package:flutter/foundation.dart';
import 'package:learningo/features/chapters/domain/entites/unit_detail_entity.dart';

/// States for [UnitDetailBloc].
@immutable
sealed class UnitDetailState {
  const UnitDetailState();
}

/// Initial state before loading.
final class UnitDetailInitialState extends UnitDetailState {
  const UnitDetailInitialState();
}

/// Loading state.
final class UnitDetailLoadingState extends UnitDetailState {
  const UnitDetailLoadingState();
}

/// State when unit details are loaded.
final class UnitDetailLoadedState extends UnitDetailState {
  final UnitDetailEntity unitDetail;
  final bool isIndexView;

  const UnitDetailLoadedState({
    required this.unitDetail,
    this.isIndexView = true,
  });

  UnitDetailLoadedState copyWith({
    UnitDetailEntity? unitDetail,
    bool? isIndexView,
  }) {
    return UnitDetailLoadedState(
      unitDetail: unitDetail ?? this.unitDetail,
      isIndexView: isIndexView ?? this.isIndexView,
    );
  }
}

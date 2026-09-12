import 'package:flutter/foundation.dart';

/// Events for [UnitDetailBloc].
@immutable
sealed class UnitDetailEvent {
  const UnitDetailEvent();
}

/// Event to load unit detail by its ID.
final class LoadUnitDetailEvent extends UnitDetailEvent {
  final int unitId;

  const LoadUnitDetailEvent({this.unitId = 2});
}

/// Event to toggle view mode (index vs tiles).
final class ToggleViewModeEvent extends UnitDetailEvent {
  final bool isIndexView;

  const ToggleViewModeEvent({required this.isIndexView});
}

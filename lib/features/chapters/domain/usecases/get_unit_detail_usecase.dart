import 'package:learningo/core/usecases/usecase.dart';
import 'package:learningo/features/chapters/domain/entites/unit_detail_entity.dart';
import 'package:learningo/features/chapters/domain/repositories/chapters_repository.dart';

/// Use case to fetch detailed information and topic index for a unit.
class GetUnitDetailUseCase implements UseCase<UnitDetailEntity, int> {
  final ChaptersRepository repository;

  const GetUnitDetailUseCase(this.repository);

  @override
  Future<UnitDetailEntity> call(int params) async {
    return await repository.getUnitDetail(params);
  }
}

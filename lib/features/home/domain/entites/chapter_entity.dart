/// Domain entity representing a learning chapter and its syllabus units.
class ChapterEntity {
  final int id;
  final int index;
  final String nameEn;
  final String nameHi;
  final List<String> units;

  const ChapterEntity({
    required this.id,
    required this.index,
    required this.nameEn,
    required this.nameHi,
    required this.units,
  });
}

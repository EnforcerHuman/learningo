/// Domain entity representing a concept where the user made mistakes or slipped.
class SlippedConceptEntity {
  final String title;
  final String? imageUrl;

  const SlippedConceptEntity({
    required this.title,
    this.imageUrl,
  });
}

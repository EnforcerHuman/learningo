import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/features/chapters/domain/entites/unit_detail_entity.dart';

/// Card container rendering the list of topics in a unit with item codes and action arrows.
class UnitTopicsList extends StatelessWidget {
  final List<TopicItemEntity> topics;
  final ValueChanged<TopicItemEntity>? onTopicTap;

  const UnitTopicsList({
    super.key,
    required this.topics,
    this.onTopicTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.topicListBackground,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.topicListBorder,
          width: 1.5,
        ),
      ),
      child: Column(
        children: List.generate(topics.length, (index) {
          final topic = topics[index];
          final isLast = index == topics.length - 1;

          return Column(
            children: [
              _buildTopicItem(topic),
              if (!isLast)
                const Divider(
                  height: 1,
                  thickness: 1,
                  color: AppColors.topicItemDivider,
                ),
            ],
          );
        }),
      ),
    );
  }

  Widget _buildTopicItem(TopicItemEntity topic) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => onTopicTap?.call(topic),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              // Topic Code (e.g. "2.1")
              SizedBox(
                width: 32,
                child: Text(
                  topic.code,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: AppColors.topicNumberGrey,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Topic Title
              Expanded(
                child: Text(
                  topic.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                    letterSpacing: -0.2,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Circular Arrow Indicator
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.topicArrowCircleBorder,
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_forward_rounded,
                  size: 14,
                  color: AppColors.topicArrowGreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

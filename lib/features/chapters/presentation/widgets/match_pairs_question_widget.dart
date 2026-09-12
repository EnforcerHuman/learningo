import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/core/config/responsive_utils.dart';
import 'package:learningo/features/chapters/domain/entites/question_entity.dart';

/// Interactive Match the Pairs question widget where users connect left items with right partners.
class MatchPairsQuestionWidget extends StatefulWidget {
  final QuestionEntity question;
  final ValueChanged<Map<String, String>>? onPairsCompleted;

  const MatchPairsQuestionWidget({
    super.key,
    required this.question,
    this.onPairsCompleted,
  });

  @override
  State<MatchPairsQuestionWidget> createState() =>
      _MatchPairsQuestionWidgetState();
}

class _MatchPairsQuestionWidgetState extends State<MatchPairsQuestionWidget> {
  String? _selectedLeftId;
  String? _selectedRightId;
  final Map<String, String> _pairedLeftToRight = {};

  late final List<PairItemEntity> _leftItems;
  late final List<PairItemEntity> _rightItems;

  @override
  void initState() {
    super.initState();
    _leftItems = widget.question.leftPairs ??
        const [
          PairItemEntity(
            id: 'l1',
            text: 'World Day of Social\nJustice',
            matchId: 'r1',
          ),
          PairItemEntity(
            id: 'l2',
            text: 'World Radio Day',
            matchId: 'r2',
          ),
          PairItemEntity(
            id: 'l3',
            text: 'World Cancer Day',
            matchId: 'r3',
          ),
          PairItemEntity(
            id: 'l4',
            text: 'International Day of\nWomen and Girls in\nScience',
            matchId: 'r4',
          ),
        ];

    _rightItems = widget.question.rightPairs ??
        const [
          PairItemEntity(id: 'r1', text: '20 February', matchId: 'l1'),
          PairItemEntity(id: 'r2', text: '13 February', matchId: 'l2'),
          PairItemEntity(id: 'r3', text: '4 February', matchId: 'l3'),
          PairItemEntity(id: 'r4', text: '11 February', matchId: 'l4'),
        ];
  }

  void _onLeftTap(String id) {
    if (_pairedLeftToRight.containsKey(id)) return;
    setState(() {
      _selectedLeftId = id;
      if (_selectedRightId != null) {
        _attemptPair(id, _selectedRightId!);
      }
    });
  }

  void _onRightTap(String id) {
    if (_pairedLeftToRight.containsValue(id)) return;
    setState(() {
      _selectedRightId = id;
      if (_selectedLeftId != null) {
        _attemptPair(_selectedLeftId!, id);
      }
    });
  }

  void _attemptPair(String leftId, String rightId) {
    final leftItem = _leftItems.firstWhere((item) => item.id == leftId);
    if (leftItem.matchId == rightId) {
      _pairedLeftToRight[leftId] = rightId;
      _selectedLeftId = null;
      _selectedRightId = null;
      widget.onPairsCompleted?.call(_pairedLeftToRight);
    } else {
      // Clear selection on mismatch
      _selectedLeftId = null;
      _selectedRightId = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Top Question Prompt Card
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: responsive.scale(20),
            vertical: responsive.scale(22),
          ),
          decoration: BoxDecoration(
            color: AppColors.optionCardBackground,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: AppColors.questionCardBorder,
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Tag Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.questionTagBackground,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  widget.question.tagText.isNotEmpty
                      ? widget.question.tagText
                      : 'MATCH THE PAIRS',
                  style: const TextStyle(
                    fontSize: 11.5,
                    fontWeight: FontWeight.w800,
                    color: AppColors.questionTagText,
                    letterSpacing: 0.8,
                  ),
                ),
              ),
              SizedBox(height: responsive.scale(16)),

              // Question Title
              Text(
                widget.question.title.isNotEmpty
                    ? widget.question.title
                    : 'Pick the right partner for each item on the left',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: responsive.font(21),
                  fontWeight: FontWeight.w800,
                  color: AppColors.textPrimary,
                  height: 1.25,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: responsive.scale(16)),

        // 2-Column Matching Grid
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column
            Expanded(
              child: Column(
                children: _leftItems.map((item) {
                  final isPaired = _pairedLeftToRight.containsKey(item.id);
                  final isSelected = _selectedLeftId == item.id;
                  return _buildPairCard(
                    context,
                    responsive,
                    text: item.text,
                    isSelected: isSelected,
                    isPaired: isPaired,
                    onTap: () => _onLeftTap(item.id),
                  );
                }).toList(),
              ),
            ),
            SizedBox(width: responsive.scale(10)),

            // Right Column
            Expanded(
              child: Column(
                children: _rightItems.map((item) {
                  final isPaired = _pairedLeftToRight.containsValue(item.id);
                  final isSelected = _selectedRightId == item.id;
                  return _buildPairCard(
                    context,
                    responsive,
                    text: item.text,
                    isSelected: isSelected,
                    isPaired: isPaired,
                    onTap: () => _onRightTap(item.id),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPairCard(
    BuildContext context,
    ResponsiveUtils responsive, {
    required String text,
    required bool isSelected,
    required bool isPaired,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: responsive.scale(10)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(minHeight: responsive.scale(62)),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            decoration: BoxDecoration(
              color: isPaired
                  ? AppColors.matchPairCardMatchedBg
                  : (isSelected
                      ? AppColors.toggleActiveBackground
                      : AppColors.optionCardBackground),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: isSelected
                    ? AppColors.matchPairCardSelectedBorder
                    : (isPaired
                        ? AppColors.matchPairCardMatchedBorder
                        : AppColors.matchPairCardBorder),
                width: isSelected || isPaired ? 2.0 : 1.2,
              ),
            ),
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: responsive.font(13),
                  fontWeight: FontWeight.w800,
                  color: isPaired || isSelected
                      ? AppColors.optionCorrectText
                      : AppColors.textPrimary,
                  height: 1.2,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

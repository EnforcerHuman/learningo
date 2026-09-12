import 'package:flutter/material.dart';
import 'package:learningo/core/config/app_colors.dart';
import 'package:learningo/core/config/responsive_utils.dart';

/// Modal dialog shown when the user attempts to exit an active questionnaire session.
class QuitConfirmationDialog extends StatelessWidget {
  final int completedCount;
  final int totalCount;
  final VoidCallback? onKeepPlaying;
  final VoidCallback? onConfirmQuit;

  const QuitConfirmationDialog({
    super.key,
    required this.completedCount,
    required this.totalCount,
    this.onKeepPlaying,
    this.onConfirmQuit,
  });

  /// Displays the quit confirmation dialog. Returns `true` if the user confirmed quitting.
  static Future<bool?> show(
    BuildContext context, {
    required int completedCount,
    required int totalCount,
  }) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierColor: AppColors.quitDialogOverlay,
      builder: (dialogContext) {
        return QuitConfirmationDialog(
          completedCount: completedCount,
          totalCount: totalCount,
          onKeepPlaying: () => Navigator.of(dialogContext).pop(false),
          onConfirmQuit: () => Navigator.of(dialogContext).pop(true),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: responsive.scale(24)),
        constraints: const BoxConstraints(maxWidth: 380),
        decoration: BoxDecoration(
          color: AppColors.quitDialogBackground,
          borderRadius: BorderRadius.circular(28),
          boxShadow: const [
            BoxShadow(
              color: Color(0x28000000),
              blurRadius: 24,
              offset: Offset(0, 10),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              responsive.scale(24),
              responsive.scale(28),
              responsive.scale(24),
              responsive.scale(24),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Top Emoji Hand Icon
                const Text(
                  '✋',
                  style: TextStyle(
                    fontSize: 40,
                    height: 1.0,
                  ),
                ),
                SizedBox(height: responsive.scale(16)),

                // Title
                const Text(
                  'Sure you want to quit?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    color: AppColors.quitDialogTitle,
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(height: responsive.scale(10)),

                // Subtitle with dynamic progress count
                Text(
                  '$completedCount/$totalCount questions ho chuke hain · abhi nikle to ye progress chali jayegi.',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.quitDialogSubtitle,
                    height: 1.35,
                  ),
                ),
                SizedBox(height: responsive.scale(24)),

                // "NO, KEEP PLAYING" Button
                _buildKeepPlayingButton(context, responsive),
                SizedBox(height: responsive.scale(12)),

                // "YES, QUIT" Button
                _buildQuitButton(context, responsive),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildKeepPlayingButton(
    BuildContext context,
    ResponsiveUtils responsive,
  ) {
    return Container(
      width: double.infinity,
      height: responsive.scale(54),
      decoration: BoxDecoration(
        color: AppColors.quitKeepPlayingBackground,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: AppColors.quitKeepPlayingBorder,
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: onKeepPlaying ?? () => Navigator.of(context).pop(false),
        borderRadius: BorderRadius.circular(28),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Icon(
                Icons.arrow_back_rounded,
                size: 18,
                color: AppColors.quitKeepPlayingText,
              ),
              SizedBox(width: 8),
              Text(
                'NO, KEEP PLAYING',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  color: AppColors.quitKeepPlayingText,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuitButton(
    BuildContext context,
    ResponsiveUtils responsive,
  ) {
    return Container(
      width: double.infinity,
      height: responsive.scale(54),
      decoration: BoxDecoration(
        color: AppColors.quitConfirmButton,
        borderRadius: BorderRadius.circular(28),
      ),
      child: InkWell(
        onTap: onConfirmQuit ?? () => Navigator.of(context).pop(true),
        borderRadius: BorderRadius.circular(28),
        child: const Center(
          child: Text(
            'YES, QUIT',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w800,
              color: AppColors.textWhite,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

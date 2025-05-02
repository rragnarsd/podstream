import 'package:flutter/material.dart';
import 'package:podstream/utils/constants/pod_colors.dart';
import 'package:podstream/utils/constants/pod_text_styles.dart';
import 'package:podstream/widgets/spacers.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class AppIconElevatedButton extends StatelessWidget {
  const AppIconElevatedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.textColor,
  });

  final VoidCallback onPressed;
  final String title;
  final Color? backgroundColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(
        Icons.arrow_forward,
        color: PodColors.whiteColor,
        size: 22,
      ),
      iconAlignment: IconAlignment.end,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? PodColors.tealColor,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onPressed,
      label: Text(
        title,
        style: PodTextStyles.bodyLarge.copyWith(
          color: textColor ?? PodColors.whiteColor,
        ),
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.backgroundColor,
    this.textColor,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
  });

  final VoidCallback onPressed;
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 3),
        backgroundColor: backgroundColor ?? PodColors.whiteColor,
        padding: padding,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: PodTextStyles.bodyLarge.copyWith(
          color: textColor ?? PodColors.textColor,
        ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: child);
  }
}

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.iconSize = 26,
    this.borderColor,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double? iconSize;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: backgroundColor ?? PodColors.whiteColor,
        shape: CircleBorder(
          side: BorderSide(width: 3, color: borderColor ?? PodColors.textColor),
        ),
      ),
      onPressed: onPressed,
      icon: Icon(icon, color: iconColor ?? PodColors.textColor, size: iconSize),
    );
  }
}

class AppIconButtonOutlined extends StatelessWidget {
  const AppIconButtonOutlined({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
  });

  final String title;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.outlined(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 3),
        backgroundColor: PodColors.whiteColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
      onPressed: onPressed,
      icon: Row(
        children: [
          Icon(icon, color: PodColors.textColor),
          const AppSpacer(width: 8),
          Text(title, style: PodTextStyles.bodyLarge),
        ],
      ),
    );
  }
}

import 'package:chili_app/resources/resources.dart';
import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({super.key, this.onPressed,});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IconButton(
      enableFeedback: true,
      onPressed: onPressed,
      icon: AppIcon.arrow,
      style: theme.iconButtonTheme.style,
    );
  }
}

import 'package:chili_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class EnterButton extends StatelessWidget {
  const EnterButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: 200.0,
      child: FloatingActionButton.extended(
        enableFeedback: true,
        onPressed: onPressed,
        label: Text(
          S.of(context).enter,
          style: theme.textTheme.labelLarge,
        ),
      ),
    );
  }
}

import 'package:chili_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class FailureLoadingList extends StatelessWidget {
  const FailureLoadingList({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            S.of(context).somethingWentWrong,
            style: theme.textTheme.displayLarge,
          ),
          Text(
            S.of(context).pleaseTryAgainLater,
            style: theme.textTheme.displaySmall,
          ),
          const SizedBox(height: 30.0),
          TextButton(
            onPressed: onPressed,
            child: Text(
              S.of(context).tryAgain,
              style: theme.textTheme.labelLarge,
            ),
          ),
        ],
      ),
    );
  }
}
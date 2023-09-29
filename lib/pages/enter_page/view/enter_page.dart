import 'package:chili_app/generated/l10n.dart';
import 'package:flutter/material.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  static const String routeName = '/';

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: theme.appBarTheme.titleTextStyle,
        centerTitle: theme.appBarTheme.centerTitle,
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(S.of(context).chiliapp),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).welcomeToChiliapp,
              style: theme.textTheme.displayLarge,
            ),
            Text(
              S.of(context).clickAndContinue,
              style: theme.textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}

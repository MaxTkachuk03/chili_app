import 'package:chili_app/generated/l10n.dart';
import 'package:chili_app/pages/enter_page/view/enter_page.dart';
import 'package:chili_app/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: theme.appBarTheme.titleTextStyle,
        centerTitle: theme.appBarTheme.centerTitle,
        backgroundColor: theme.appBarTheme.backgroundColor,
        title: Text(S.of(context).chiliapp),
        leading: CustomIconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }
}

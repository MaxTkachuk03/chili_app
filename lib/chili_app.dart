import 'package:chili_app/pages/pages.dart';
import 'package:chili_app/resources/resources.dart';
import 'package:chili_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';

class ChiliApp extends StatelessWidget {
  const ChiliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: AppTheme.theme,
      initialRoute: EnterPage.routeName,
      onGenerateRoute: AppRouter.generateRoute,
      // routes: {
      //   EnterPage.routeName: (_) => const EnterPage(),
      //    EnterPage.routeName: (_) => const EnterPage(),
      // },
    );
  }
}

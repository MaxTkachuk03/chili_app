import 'package:chili_app/bloc/check_internet_bloc/check_internet_bloc.dart';
import 'package:chili_app/pages/pages.dart';
import 'package:chili_app/repository/repository.dart';
import 'package:chili_app/resources/resources.dart';
import 'package:chili_app/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'generated/l10n.dart';

class ChiliApp extends StatelessWidget {
  const ChiliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CheckInternetBloc(
            GetIt.I<InternetConnection>(),
          ),
        ),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}

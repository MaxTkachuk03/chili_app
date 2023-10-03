import 'package:chili_app/bloc/check_internet_bloc/check_internet_bloc.dart';
import 'package:chili_app/generated/l10n.dart';
import 'package:chili_app/pages/pages.dart';
import 'package:chili_app/repository/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({super.key});

  static const String routeName = '/';

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  final _checkConnection = CheckInternetBloc(GetIt.I<InternetConnection>());

  @override
  void initState() {
    super.initState();
    _checkConnection.add(const CheckInternetEvent());
  }

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
      body: BlocBuilder<CheckInternetBloc, CheckInternetState>(
        bloc: _checkConnection,
        builder: (context, state) {
          return Center(
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
                const SizedBox(
                  height: 15.0,
                ),
                EnterButton(
                  onPressed: () {
                    if (state is DoneCheckInternetState) {
                      _checkConnection.add(const CheckInternetEvent());

                      if (state.checkIternet == true) {
                        Navigator.of(context).pushNamed(
                          HomePage.routeName,
                        );
                      }
                      if (state.checkIternet == false) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(S.of(context).pleaseConnectToInternet),
                        ));
                      }
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:chili_app/bloc/check_internet_bloc/check_internet_bloc.dart';
import 'package:chili_app/generated/l10n.dart';
import 'package:chili_app/pages/enter_page/enter_page.dart';
import 'package:chili_app/pages/home_page/home_page.dart';
import 'package:chili_app/repository/repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String routeName = 'home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _checkConnection = CheckInternetBloc(GetIt.I<InternetConnection>());

  @override
  void initState() {
    super.initState();
    _checkConnection.add(const CheckInternetEvent());
    GifsRepository(dio: Dio(),).getGifs('', 0);
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
          leading: CustomIconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: BlocBuilder<CheckInternetBloc, CheckInternetState>(
          bloc: _checkConnection,
          builder: (context, state) {
            if (state is DoneCheckInternetState) {
              if (state.checkIternet == true) {
                return GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container();
                  },
                );
              }
            }
            return FailureLoadingList(
              onPressed: () {
                _checkConnection.add(const CheckInternetEvent());
              },
            );
          },
        ));
  }
}

import 'package:chili_app/bloc/check_internet_bloc/check_internet_bloc.dart';
import 'package:chili_app/bloc/gifs_bloc/bloc/gifs_bloc.dart';
import 'package:chili_app/generated/l10n.dart';
import 'package:chili_app/pages/home_page/home_page.dart';
import 'package:chili_app/repository/repository.dart';
import 'package:chili_app/resources/resources.dart';
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
  final _checkConnection = CheckInternetBloc(
    GetIt.I<InternetConnection>(),
  );

  final _gifsBloc = GifsBloc(
    GetIt.I<AbstractGifsRepository>(),
  );

  @override
  void initState() {
    super.initState();
    _checkConnection.add(const CheckInternetEvent());
    _gifsBloc.add(GifsSearchEvent());
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
              return Column(
                children: [
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      const Spacer(),
                      Flexible(
                        flex: 8,
                        child: TextField(
                          onSubmitted: (text) {
                            _gifsBloc.add(GifsSearchEvent(
                              searching: text.trim(),
                              landslide: 0,
                            ));
                          },
                          decoration: InputDecoration(
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                            labelText: S.of(context).writeName,
                            labelStyle: theme.textTheme.labelLarge,
                            enabledBorder: AppBorder.enabledBorder,
                            focusedBorder: AppBorder.focusedBorder,
                          ),
                          style: theme.textTheme.displaySmall,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  Expanded(
                    child: BlocBuilder<GifsBloc, GifsState>(
                      bloc: _gifsBloc,
                      builder: (context, state) {
                        if (state is GifsSearchedState) {
                          final gifs = state.gifs;
                          return GifsGridView(gifs: gifs);
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          }
          return FailureLoadingList(
            onPressed: () {
              _checkConnection.add(const CheckInternetEvent());
            },
          );
        },
      ),
    );
  }
}

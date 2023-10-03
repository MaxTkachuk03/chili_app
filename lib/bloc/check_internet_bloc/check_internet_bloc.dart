import 'package:chili_app/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'check_internet_event.dart';
part 'check_internet_state.dart';

class CheckInternetBloc extends Bloc<CheckInternetEvent, CheckInternetState> {
  CheckInternetBloc(this.checkInternet) : super(CheckInternetInitialState()) {
    on<CheckInternetEvent>((event, emit) async {
      try {
        final result = await checkInternet.checkInternet();
        emit(DoneCheckInternetState(checkIternet: result));
      } catch (e) {
         emit(ErrorCheckInternetState(exception: e));
      }
    });
  }

  final InternetConnection checkInternet;
}

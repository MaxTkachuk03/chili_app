part of 'check_internet_bloc.dart';

abstract class CheckInternetState extends Equatable {}

class CheckInternetInitialState extends CheckInternetState{
  @override
  List<Object?> get props => [];
}

class ErrorCheckInternetState extends CheckInternetState {
    ErrorCheckInternetState({
    this.exception,
  });
  final Object? exception;
  
  @override
  List<Object?> get props => [exception];

}

class DoneCheckInternetState extends CheckInternetState {
  DoneCheckInternetState({
    this.checkIternet = false,
  });
  final bool checkIternet;

  @override
  List<Object> get props => [checkIternet];
}

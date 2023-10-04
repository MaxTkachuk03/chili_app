// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'gifs_bloc.dart';

abstract class GifsState extends Equatable {}

final class GifsInitialState extends GifsState {
  @override
  List<Object?> get props => [];
}

class GifsSearchedState extends GifsState {
  final List<GifsModel> gifs;
  GifsSearchedState({
    required this.gifs,
  });
  @override
  List<Object?> get props => [gifs];
}

class ErrorGifsSearchedState extends GifsState {
  ErrorGifsSearchedState({
    this.exception,
  });

  final Object? exception;

  @override
  List<Object?> get props => [];
}

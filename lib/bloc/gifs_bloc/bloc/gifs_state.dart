part of 'gifs_bloc.dart';

sealed class GifsState extends Equatable {
  const GifsState();
  
  @override
  List<Object> get props => [];
}

final class GifsInitial extends GifsState {}

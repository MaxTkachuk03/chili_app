part of 'gifs_bloc.dart';

abstract class GifsEvent extends Equatable {}

class GifsSearchEvent extends GifsEvent {
  GifsSearchEvent({
    this.searching = '',
    this.landslide = 0,
    this.index = 0,
  });

  final String searching;
  final int landslide;
  final int index;

  @override
  List<Object?> get props => [
        searching,
        landslide,
        index,
      ];
}

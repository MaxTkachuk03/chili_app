import 'package:chili_app/models/models.dart';
import 'package:chili_app/repository/repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gifs_event.dart';
part 'gifs_state.dart';

class GifsBloc extends Bloc<GifsEvent, GifsState> {
  GifsBloc(this.gifsRepository) : super(GifsInitialState()) {
    on<GifsSearchEvent>(
      (event, emit) async {
        try {
          final gifs = await gifsRepository.getGifs(
            searching: event.searching,
            landslide: event.landslide,
          );
          emit(GifsSearchedState(gifs: gifs));
        } catch (e) {
          emit(ErrorGifsSearchedState(exception: e));
        }
      },
    );
  }

  final AbstractGifsRepository gifsRepository;
}

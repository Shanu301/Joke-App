import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/JokeRepository.dart';
import 'events.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeRepository repository;

  JokeBloc(this.repository) : super(JokeInitial());

  @override
  Stream<JokeState> mapEventToState(JokeEvent event) async* {
    if (event is FetchJoke) {
      try {
        final joke = await repository.getRandomJoke();
        yield JokeLoaded(joke);
      } catch (e) {
        yield JokeError("Failed to fetch joke");
      }
    }
  }
}
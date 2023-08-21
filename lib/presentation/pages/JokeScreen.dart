import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import '../../data/data_source/JokeRemoteDataSource.dart';
import '../../data/repository/JokeRepository.dart';
import '../bloc/JokeBloc.dart';
import '../bloc/events.dart';
import '../widgets/JokeList.dart';

class JokeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => JokeBloc(JokeRepository(JokeRemoteDataSource(http.Client())))
        ..add(FetchJoke()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Jokes'),
        ),
        body: JokeList(),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/JokeBloc.dart';
import '../bloc/events.dart';

class JokeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<JokeBloc, JokeState>(
      builder: (context, state) {
        if (state is JokeLoaded) {
          return ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                shape: Border(right: BorderSide(color: Colors.red, width: 5)),
                child:  ListTile(
                  title: Text(state.joke),

                )
              );


            },
          );
        } else if (state is JokeError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

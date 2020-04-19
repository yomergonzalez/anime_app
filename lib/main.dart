import 'package:animeapp/pages/tab_bars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/media_anime/media_anime_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anime App',
      theme: ThemeData(
        backgroundColor: Colors.transparent,
          bottomAppBarColor: Colors.transparent,
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.transparent
          ),
      ),
      home: BlocProvider(
          create: (BuildContext context) => MediaAnimeBloc()..getCover(),
          child: TabBars()
      ),
    );
  }

}
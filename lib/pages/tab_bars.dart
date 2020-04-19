import 'package:animeapp/bloc/media_anime/media_anime_bloc.dart';
import 'package:animeapp/bloc/media_anime/media_anime_state.dart';
import 'package:animeapp/pages/favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home.dart';

class TabBars extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaAnimeBloc, MediaAnimeState>(
        builder: (BuildContext context, state){
          if(state is LoadingMediaAnimeState){
            return Scaffold(
              backgroundColor: Colors.black87,
              body: Center(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "ANIMETFLIX",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            );
          }
          return buildDefaultTabController();
    });
  }

  DefaultTabController buildDefaultTabController() {
    return DefaultTabController(
    length: 2,
    child: Scaffold(
      backgroundColor: Colors.grey[900],
      bottomNavigationBar: TabBar(
        labelColor: Colors.red,
        unselectedLabelColor: Colors.grey,
        indicatorColor: Colors.red,
        tabs: [
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.favorite)),
        ],
      ),
      body: TabBarView(
        children: [
          Home(),
          FavoritesPage(),
        ],
      ),
    ),
  );
  }
}

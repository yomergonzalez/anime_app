import 'package:animeapp/bloc/media_anime/media_anime_bloc.dart';
import 'package:animeapp/bloc/media_anime/media_anime_state.dart';
import 'package:animeapp/components/cover_home.dart';
import 'package:animeapp/components/slider_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>  with AutomaticKeepAliveClientMixin<Home>  {

  MediaAnimeBloc _media2 = MediaAnimeBloc();
  MediaAnimeBloc _media3 = MediaAnimeBloc();
  MediaAnimeBloc _media4 = MediaAnimeBloc();
  @override
  void initState() {
    super.initState();
    _media2.getTrendingAnimeList();
    _media3.getAnimeList();
    _media4.getTrendingMangaList();
    }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black87,
      body: ListView(
            children: <Widget>[
              CoverHome(),
              BlocProvider.value(
                value: _media2,
                child: SliderSection(
                    type: SectionType.Trending,
                    title: "Trending Week"
                ),
              ),
              Divider(),
              BlocProvider.value(
                value: _media3,
                child: SliderSection(
                    type: SectionType.MostPopular,
                    title: "Most Popular"
                ),
              ),
              Divider(),
              BlocProvider.value(
                value: _media4,
                child: SliderSection(
                    type: SectionType.TopManga,
                    title: "Top Manga"
                ),
              )
            ]
      )
    );

  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}

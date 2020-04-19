import 'package:animeapp/bloc/media_anime/media_anime_bloc.dart';
import 'package:animeapp/bloc/media_anime/media_anime_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';
import 'anime_row.dart';

enum  SectionType { Trending, MostPopular, TopManga }

class SliderSection extends StatelessWidget {

  final SectionType type;
  final String title;

  const SliderSection({Key key, @required this.type, @required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    /*switch(type){
      case SectionType.MostPopular:
        BlocProvider.of<MediaAnimeBloc>(context).getAnimeList();
        break;
      case SectionType.Trending:
        BlocProvider.of<MediaAnimeBloc>(context).getTrendingAnimeList();
        break;
      case SectionType.TopManga:
        BlocProvider.of<MediaAnimeBloc>(context).getTrendingMangaList();
        break;
    }*/

    return Container(
      height: 250,
      child: Container(
        margin: EdgeInsets.only(top: 10,bottom: 10),
        child: Column(
          children: <Widget>[
            _title(),
            _content()
          ],
        ),
      ),
    );
  }

  _title() {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.only(left: 10),
      child: Text(this.title, style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),),
    );
  }

  _content(){
    return Container(
      child: BlocBuilder<MediaAnimeBloc, MediaAnimeState>(
          builder: (context, state) {
            if(state is LoadingMediaAnimeState){
              return Center(child: Loading(indicator: BallScaleIndicator(), size: 100.0, color: Colors.pink,));
            }
            return _slider(state);
          }
      ),
    );
  }

  _slider(MediaAnimeState state){

    if(state.animeList == null) {
      return Container();
    }

    return Flexible(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: state.animeList.data.length,
        itemBuilder: (context, index) {
          return AnimeRow(anime: state.animeList.data[index]);
        },
      ),
    );
  }

}



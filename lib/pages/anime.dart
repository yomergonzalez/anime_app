import 'package:animeapp/bloc/episodes/bloc.dart';
import 'package:animeapp/components/episode_row.dart';
import 'package:animeapp/components/favorite_icon.dart';
import 'package:animeapp/models/AnimeList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';

class AnimePage extends StatelessWidget {

  final Data anime;
  EpisodesBloc bloc;

  AnimePage({Key key, @required this.anime}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    bloc = EpisodesBloc();
    bloc.getEpisodes(anime.type, anime.id);

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: <Widget>[
          content(),
          SafeArea(
            top: true,
              child: headerRow()
          ),
        ],
      )
    );
  }

  headerRow() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87.withOpacity(0.6)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          BackButton(
            color: Colors.white,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 15,bottom: 15, left: 5, right: 5),
              child: Text(anime.attributes.canonicalTitle, textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 17),),
            ),
          ),
          FavoriteIcon(anime: anime,)
        ],
      ),
    );
  }

  content(){
    return ListView(
        children: <Widget>[
          imageHeader(),
          shareActions(),
          episodesList()
        ]
    );
  }

  Container imageHeader() {
    return Container(
    height: 360,
    width: double.maxFinite,
    decoration: BoxDecoration(
      image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
          image: Image.network(anime.attributes.posterImage.small).image,
        fit: BoxFit.fitWidth
      )
    ),
    child: Column(
      children: <Widget>[
        Container(
          height: 180,
          margin: EdgeInsets.only(top: 70, bottom: 10),
            child: Image.network(anime.attributes.posterImage.small, width: 150)
        ),
        Container(
          color: Colors.black87.withOpacity(0.4),
          padding: EdgeInsets.only(top: 16, left: 20,right: 20, bottom: 20),
          child: Row(
            children: <Widget>[
              Flexible(
                  child: Text(
                    anime.attributes.synopsis,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.white60),)
              )
            ],
          ),
        )
      ],
    ),
  );
  }

  Container shareActions(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          buttomWithName("Mi Lista", Icons.add),
          buttomWithName("Calificar", Icons.thumb_up),
          buttomWithName("Compartir", Icons.share)
        ],
      ),
    );
  }

  Container episodesList(){
    return Container(
      child: BlocBuilder<EpisodesBloc, EpisodesState>(
          bloc: bloc, // provide the local bloc instance
          builder: (context, state) {

            if(state is LoadingEpisodesState){
              return Center(child: Loading(indicator: BallScaleIndicator(), size: 100.0, color: Colors.red,));
            }
            return Column(
              children: state.episodes.map((data){
                return EpisodeRow(episode: data);
              }).toList(),
            );
          }
      ) ,
    );
  }


  Widget buttomWithName(String name, IconData icon){
    return Container(
      color: Colors.black54,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Column(
        children: <Widget>[
          Icon(icon, color: Colors.white60,size: 20),
          Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(name, style: TextStyle(color: Colors.white60, fontSize: 13)))
        ],
      ),
    );
  }

}


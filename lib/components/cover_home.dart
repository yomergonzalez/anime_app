
import 'package:animeapp/bloc/media_anime/bloc.dart';
import 'package:animeapp/models/AnimeList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoverHome extends StatelessWidget {

  Data data;

  @override
  Widget build(BuildContext context) {

    //BlocProvider.of<MediaAnimeBloc>(context).getCover();

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Stack(
        children: <Widget>[
          _image(),
          _title()
        ],
      ),
    );
  }

  _title() => Positioned(
      bottom: 10,
      left: 10,
      child:BlocBuilder<MediaAnimeBloc, MediaAnimeState>(
      builder: (context, state){
        var title = "";
        if(state.anime != null){
          title = state.anime.attributes.canonicalTitle;
        }
        return Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black87.withOpacity(0.5), Colors.black87.withOpacity(0.3),Colors.white.withOpacity(0.2),Colors.transparent],
                  stops: [0.1,0.3,0.7,0.9],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
              )
          ),
          child: Text(title,
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold
              )
          ),
        );

      })
  );

  _image(){
    return Container(
      height: 250,
      color: Colors.grey,
      child: BlocBuilder<MediaAnimeBloc, MediaAnimeState>(
          builder: (context, state) {
            if(state is LoadingMediaAnimeState){
              return Container();
            }

            if(state.anime!= null ){
              return  Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(state.anime.attributes.coverImage.small).image,
                    fit: BoxFit.cover
                  )
                ),
              );
            }
            return Container();
          }
      )
    );

  }


}

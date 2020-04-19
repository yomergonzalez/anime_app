import 'package:animeapp/models/Episodes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EpisodeRow extends StatelessWidget {

  final DataList episode;

  EpisodeRow({Key key, @required this.episode}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    if(episode.attributes.canonicalTitle == null){
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("No Results", style: TextStyle(color: Colors.white),),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 100,
                height: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(episode.attributes.thumbnail.original).image
                  )
                ),
                child: Icon(Icons.play_circle_outline, color: Colors.white60, size: 60,),
              ),
              Flexible(
                child: Container(
                  width: 250,
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(episode.attributes.number.toString()+". "+episode.attributes.canonicalTitle,
                      style: TextStyle(color: Colors.white70, fontSize: 17),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left),
                      Text(episode.attributes.createdAt,
                          style: TextStyle(color: Colors.white60))
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Icon(Icons.arrow_downward, size: 25, color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}

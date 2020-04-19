import 'package:animeapp/models/AnimeList.dart';
import 'package:animeapp/pages/anime.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimeRow extends StatelessWidget {

  final Data anime;

  const AnimeRow({Key key, @required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => AnimePage(anime: anime)),
        );
      },
      child: Container(
        width: 120,
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            _image(),
            Flexible(child: _title())
          ],
        ),
      ),
    );
  }

  _image() => Image.network(anime.attributes.posterImage.tiny);

  _title() => Container(
    padding: EdgeInsets.only(left: 10,right: 10),
    child: Text(anime.attributes.canonicalTitle, style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),maxLines: 2,softWrap: true,),
  );

}

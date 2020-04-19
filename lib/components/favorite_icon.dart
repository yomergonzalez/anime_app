import 'dart:convert';

import 'package:animeapp/models/AnimeList.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteIcon extends StatefulWidget {

  final Data anime;

  const FavoriteIcon({Key key,@required this.anime}) : super(key: key);

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _selected = false;

  Future<void> _saveFavorite() async {

    _prefs.then((SharedPreferences prefs) {
      List<String> value2 =  (prefs.getStringList('animes'));
      if(value2== null) value2 = new List<String>();
      value2.add(widget.anime.id);
      prefs.setStringList("animes",value2).then((bool success) {
        prefs.setStringList(widget.anime.id, [widget.anime.attributes.canonicalTitle, widget.anime.attributes.posterImage.small,widget.anime.attributes.synopsis]);
        setState(() {
          _selected = true;
        });
      });
    });
  }

  Future<void> _deleteFavorite() async {
    _prefs.then((SharedPreferences prefs) {
      List<String> value2 =  (prefs.getStringList('animes'));
      value2.removeWhere((element){
        return element == widget.anime.id.toString();
      });
      prefs.remove(widget.anime.id);
      prefs.setStringList("animes",value2).then((bool success) {
        setState(() {
          _selected = false;
        });
      });
      });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _prefs.then((SharedPreferences prefs) {
      List<String> value2 =  (prefs.getStringList('animes'));
      if(value2!=null){
        var value = value2.any((element){
          return element == widget.anime.id;
        });
        setState(() {
          _selected = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _selected == true? _deleteFavorite() : _saveFavorite();
      },
      child: Container(
        padding: EdgeInsets.all(10),
        child: Icon(
            (_selected) ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
      ),
    );
  }
}

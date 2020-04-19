import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool _loading = true;
  Map<String, List<String>> list = Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getFavorites();
  }

  Future<void> getFavorites() async {

    _prefs.then((SharedPreferences prefs) {
      List<String> value2 =  (prefs.getStringList('animes'));
      if(value2== null) value2 = new List<String>();
        value2.forEach((element){
          var data = (prefs.getStringList(element));
            list[element] =  data.toList();
        });
        setState(() {
          _loading = false;
        });
     });
    }


  @override
  Widget build(BuildContext context) {
    var stack = Stack(
          children: <Widget>[
            content(),
            SafeArea(
              top: true,
              child: headerRow(),
            ),
          ],
        );

    return Scaffold(
        backgroundColor:  Colors.black87,
        body: _loading?  Center(child: Loading(indicator: BallScaleIndicator(), size: 100.0, color: Colors.red,)) : stack
    );
  }

  headerRow() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black87.withOpacity(0.6)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 15,bottom: 15, left: 5, right: 5),
              child: Text("Favorites", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20),),
            ),
          ),
        ],
      ),
    );
  }

  content(){
    if(list.isEmpty){
      return Center(
        child: Text("There isn't any anime marked as favorite",
        style: TextStyle(color: Colors.white60),),
      );
    }

    return Container(
      margin: EdgeInsets.only(top: 50),
      child: ListView(
          children: animeList()
      ),
    );
  }

  animeList() {
    List<Widget> listWidget = [];
    list.forEach((key,value){
       var element =  Container(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Image.network(value[1]).image
                  )
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(value[0], style: TextStyle(color: Colors.white60, fontSize: 20),
                        maxLines: 2,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis
                      ),
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    Container(
                      child: Text(value[2],
                          style: TextStyle(color: Colors.white60, fontSize: 16),
                        maxLines: 5,
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
              Divider()

            ],
          ),

        );

       listWidget.add(element);

    });

    return listWidget;

  }

}

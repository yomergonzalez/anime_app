import 'dart:convert';
import 'dart:math';

import 'package:animeapp/models/Episodes.dart';
import 'package:http/http.dart' as http;
import 'package:animeapp/models/AnimeList.dart';

class KitsuAPI{

  String _baseUrl = 'https://kitsu.io/api/';


  Future<Data> randomAnime() async {
    var client = http.Client();
    try {

      var rng = new Random();
      var id =rng.nextInt(100).toString();
      var url = _baseUrl + "edge/anime/40";//+id;
      var uriResponse = await client.get(url);
      var body = jsonDecode(uriResponse.body);
      if(body["message"]!= null){
        throw Exception();
      }
      return Data.fromJson(body["data"]);
    } finally {
      client.close();
    }
  }


  Future<AnimeList> topAnimeList() async {
    var client = http.Client();
    try {
      var url = _baseUrl + "edge/anime";
      var uriResponse = await client.get(url);
      var body = jsonDecode(uriResponse.body);
      if(body["message"]!= null){
        throw Exception();
      }
      return AnimeList.fromJson(body);
    } finally {
      client.close();
    }
  }


  Future<AnimeList> trendingAnimeList() async {
    var client = http.Client();
    try {
      var url = _baseUrl + "/edge/anime?page[limit]=10&page[offset]=10";
      var uriResponse = await client.get(url);
      var body = jsonDecode(uriResponse.body);
      if(body["message"]!= null){
        throw Exception();
      }
      return AnimeList.fromJson(body);
    } finally {
      client.close();
    }
  }



  Future<AnimeList> trendingMangaList() async {
    var client = http.Client();
    try {
      var url = _baseUrl + "/edge/trending/manga";
      var uriResponse = await client.get(url);
      var body = jsonDecode(uriResponse.body);

      if(body["message"]!= null){
        throw Exception();
      }
      return AnimeList.fromJson(body);
    } finally {
      client.close();
    }
  }

  Future<Episodes> getEpisodes(String type, String Id) async {
    var client = http.Client();
    try {
      var type1 = (type == "anime")? "Anime": "Mange";
      var url = _baseUrl + "/edge/episodes?filter[mediaType]="+type1+"&filter[media_id]="+Id+"&sort=number";
      var uriResponse = await client.get(url);
      var body = jsonDecode(uriResponse.body);

      if(body["message"]!= null){
        throw Exception();
      }
      return Episodes.fromJson(body);
    } finally {
      client.close();
    }
  }



}
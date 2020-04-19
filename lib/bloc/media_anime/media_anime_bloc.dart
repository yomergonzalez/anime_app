import 'dart:async';
import 'package:animeapp/services/KitsuAPI.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class MediaAnimeBloc extends Bloc<MediaAnimeEvent, MediaAnimeState> {
  @override
  MediaAnimeState get initialState => InitialMediaAnimeState();
  KitsuAPI _kitsuAPI = new KitsuAPI();

  @override
  Stream<MediaAnimeState> mapEventToState(
    MediaAnimeEvent event,
  ) async* {
    if(event is LoadingMediaAnimeEvent){
      yield LoadingMediaAnimeState();
    }
    if(event is SuccessMediaAnimeEvent){
        var init = InitialMediaAnimeState()..animeList = event.animeList;
        yield init;
    }
    if(event is FailMediaAnimeEvent){
      yield FailMediaAnimeState(event.message);
    }

    if(event is LoadedCoverMediaAnimeEvent){
      var init = InitialMediaAnimeState()..anime = event.anime;
      yield init;
    }
  }


  void getCover(){
    add(LoadingMediaAnimeEvent());
    _kitsuAPI.randomAnime().then((value){
      add(LoadedCoverMediaAnimeEvent(value));
    }).catchError((onError){
      print(onError);

    });
  }

  void getAnimeList(){
    add(LoadingMediaAnimeEvent());
    _kitsuAPI.topAnimeList().then((value){
      add(SuccessMediaAnimeEvent(value));
    }).catchError((onError){
      print(onError);
    });
  }

  void getTrendingAnimeList(){
    add(LoadingMediaAnimeEvent());
    _kitsuAPI.trendingAnimeList().then((value){
      add(SuccessMediaAnimeEvent(value));
    }).catchError((onError){
      print(onError);

    });
  }

  void getTrendingMangaList(){
    add(LoadingMediaAnimeEvent());
    _kitsuAPI.trendingMangaList().then((value){
      add(SuccessMediaAnimeEvent(value));
    }).catchError((onError){

    });
  }


}

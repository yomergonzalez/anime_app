import 'dart:async';
import 'package:animeapp/services/KitsuAPI.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class EpisodesBloc extends Bloc<EpisodesEvent, EpisodesState> {
  @override
  EpisodesState get initialState => InitialEpisodesState();
  KitsuAPI _kitsuAPI = new KitsuAPI();

  @override
  Stream<EpisodesState> mapEventToState(
    EpisodesEvent event,
  ) async* {

    if(event is LoadingEpisodesEvent){
      yield LoadingEpisodesState();
    }
    if(event is SuccessEpisodesEvent){
      var init = InitialEpisodesState()..episodes = event.episodes;
      yield init;
    }
  }

  void getEpisodes(String type,String id){
    print({type,id});
    add(LoadingEpisodesEvent());
    _kitsuAPI.getEpisodes(type, id).then((value){
      add(SuccessEpisodesEvent(value.data));
    }).catchError((onError){
      print(onError);
    });
  }

}

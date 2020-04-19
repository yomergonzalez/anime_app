import 'package:animeapp/models/AnimeList.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MediaAnimeState {
  AnimeList animeList;
  Data anime;
}

class InitialMediaAnimeState extends MediaAnimeState {}

class LoadingMediaAnimeState extends MediaAnimeState {}

class FailMediaAnimeState extends MediaAnimeState {
  final String message;
  FailMediaAnimeState(this.message);
}


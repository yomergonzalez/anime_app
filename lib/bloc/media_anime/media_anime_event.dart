import 'package:animeapp/models/AnimeList.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MediaAnimeEvent {}

class LoadingMediaAnimeEvent extends MediaAnimeEvent {}

class SuccessMediaAnimeEvent extends MediaAnimeEvent {
  final AnimeList animeList;
  SuccessMediaAnimeEvent(this.animeList);
}

class FailMediaAnimeEvent extends MediaAnimeEvent {
  final String message;
  FailMediaAnimeEvent(this.message);
}

class LoadedCoverMediaAnimeEvent extends MediaAnimeEvent {
  final Data anime;
  LoadedCoverMediaAnimeEvent(this.anime);
}

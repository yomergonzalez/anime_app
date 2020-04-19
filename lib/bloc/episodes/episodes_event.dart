import 'package:animeapp/models/Episodes.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EpisodesEvent {}

class LoadingEpisodesEvent extends EpisodesEvent {}

class SuccessEpisodesEvent extends EpisodesEvent {
  final List<DataList> episodes;
  SuccessEpisodesEvent(this.episodes);
}
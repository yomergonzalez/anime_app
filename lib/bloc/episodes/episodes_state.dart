import 'package:animeapp/models/Episodes.dart';
import 'package:meta/meta.dart';

@immutable
abstract class EpisodesState {
  List<DataList> episodes = new List<DataList>();
}

class InitialEpisodesState extends EpisodesState {}
class LoadingEpisodesState extends EpisodesState {}


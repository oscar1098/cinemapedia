import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';


class ActorrepositoryImpl extends ActorRepository {

  final ActorDatasource datasource;

  ActorrepositoryImpl(this.datasource);

  @override
  Future<List<Actor>> getActorsMovie(String movieId) {

    return datasource.getActorsMovie(movieId);

  }
  
}




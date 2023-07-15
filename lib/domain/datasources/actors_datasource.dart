

import '../entities/actor.dart';

abstract class ActorDatasource {

  Future <List<Actor>> getActorsMovie( String movieId );



}





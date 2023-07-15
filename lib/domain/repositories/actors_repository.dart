import '../entities/actor.dart';



abstract class ActorRepository {

  Future <List<Actor>> getActorsMovie( String movieId );



}





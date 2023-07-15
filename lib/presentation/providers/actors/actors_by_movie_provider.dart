import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/actor.dart';
import 'actors_repository_provider.dart';

final actorByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {

  final actorReposiroty = ref.watch( actorsRepositoryProvider );

  return ActorsByMovieNotifier( getActors: actorReposiroty.getActorsMovie );
});

/*
  '505642' : <Actor>[],
  '505643' : <Actor>[],
  '505645' : <Actor>[],
*/

typedef GetActorsCallback = Future<List<Actor>>Function( String movieId );

class ActorsByMovieNotifier extends StateNotifier<Map<String,List<Actor>>> {

  final GetActorsCallback getActors;

  ActorsByMovieNotifier({
    required this.getActors
  }): super({});

  Future<void> loadActors ( String movieId ) async {
    if ( state[movieId] != null ) return;

    final List<Actor> actors = await getActors( movieId );

    state = { ...state,movieId: actors };
  }

}





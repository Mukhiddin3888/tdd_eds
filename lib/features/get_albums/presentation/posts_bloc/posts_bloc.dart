import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/errors/map_failure_to_message.dart';
import 'package:tdd_eds/core/usecase/usecases.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/posts_entity.dart';
import 'package:tdd_eds/features/get_albums/domain/usecase/get_posts.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc({ required this.getPostsUseCase}) : super(PostsInitial()) ;



  final GetPostsUseCase getPostsUseCase ;

  @override
  Stream<PostsState> mapEventToState(PostsEvent event) async*{
    if(event is GetPostsEvent) {

      yield PostsLoading();

      final failureOrPosts = await getPostsUseCase(Params(number: event.userId));


      yield* _eitherLoadedOrErrorState(failureOrPosts);


    }

  }

  Stream<PostsState> _eitherLoadedOrErrorState( Either<Failure,List<PostsEntity>> failureOrAlbums) async*{

    yield failureOrAlbums.fold(
            (failure) => PostsLoadingError(mapFailureToMessage(failure)),
            (posts) => PostsLoaded(posts));
  }


}

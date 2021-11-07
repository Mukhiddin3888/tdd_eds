import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/errors/map_failure_to_message.dart';
import 'package:tdd_eds/core/usecase/usecases.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/entities/comments_entity.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/usecase/get_comments_usecase.dart';

part 'comments_event.dart';
part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  CommentsBloc({required this.getUseCase}) : super(CommentsInitial());



  final GetCommentsUseCase getUseCase ;

  @override
  Stream<CommentsState> mapEventToState(CommentsEvent event) async*{
    if(event is GetCommentsEvents) {

      yield Loading();

      final failureOrAlbums = await getUseCase(Params(number: event.postId));


      yield* _eitherLoadedOrErrorState(failureOrAlbums);


    }

  }


  Stream<CommentsState> _eitherLoadedOrErrorState( Either<Failure,List<CommentsEntity>> failureOrAlbums) async*{

    yield failureOrAlbums.fold(
            (failure) => LoadingError(mapFailureToMessage(failure)),
            (data) => Loaded(data));
  }


}


//bloc
/*
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app_eds/core/errors/failure.dart';
import 'package:test_app_eds/features/get_albums/domain/entities/albums_entity.dart';
import 'package:test_app_eds/features/get_albums/domain/usecase/get_albums_usecase.dart';

part 'albums_event.dart';
part 'albums_state.dart';

class AlbumsBloc extends Bloc<AlbumsEvent, AlbumsState> {
  AlbumsBloc( { required this.getAlbumsUseCase }) : super(AlbumsInitial());

  final GetAlbumsUseCase getAlbumsUseCase;

  @override
  Stream<AlbumsState> mapEventToState(AlbumsEvent event) async*{
    if(event is GetAlbumsEvent) {

      yield AlbumsLoading();

      final failureOrAlbums = await getAlbumsUseCase(Params(number: event.userId));

      yield* _eitherLoadedOrErrorState(failureOrAlbums);


    }

  }


  Stream<AlbumsState> _eitherLoadedOrErrorState( Either<Failure,AlbumsEntity> failureOrAlbums) async*{

    yield failureOrAlbums.fold(
            (failure) => AlbumsLoadingError(_mapFailureToMessage(failure)),
            (albums) => AlbumsLoaded(albums));
  }

  String _mapFailureToMessage(Failure failure){
    switch (failure.runtimeType){
      case ServerFailure:
        return 'Server Failure';

      case CacheFailure:
        return "Cache Failure";

      default:
        return "UnExpected Error";
    }
  }
}
*/



//event

/*
part of 'albums_bloc.dart';

abstract class AlbumsEvent extends Equatable {
  const AlbumsEvent();
  @override
  List<Object> get props => [];
}

class GetAlbumsEvent extends AlbumsEvent{
  final int userId;

  GetAlbumsEvent({required this.userId});


  @override
  List<Object> get props=> [userId];
}*/

//state

/*
part of 'albums_bloc.dart';

abstract class AlbumsState extends Equatable {
  const AlbumsState();

  @override
  List<Object> get props => [];
}

class AlbumsInitial extends AlbumsState {}

class AlbumsLoading extends AlbumsState {}

class AlbumsLoaded extends AlbumsState {

  final AlbumsEntity albumsEntity;

  AlbumsLoaded(this.albumsEntity);


  @override
  List<Object> get props => [albumsEntity];
}

class AlbumsLoadingError extends AlbumsState {


  final String message;

  AlbumsLoadingError(this.message);



  @override
  List<Object> get props => [message];
}


*/

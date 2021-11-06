import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/albums_entity.dart';
import 'package:tdd_eds/features/get_albums/domain/usecase/get_albums_usecase.dart';


part 'albums_new_event.dart';
part 'albums_new_state.dart';

class AlbumsNewBloc extends Bloc<AlbumsNewEvent, AlbumsNewState> {
  AlbumsNewBloc({required this.getAlbumsUseCase, }) : super(AlbumsNewInitial()) ;

  final GetAlbumsUseCase getAlbumsUseCase ;

  @override
  Stream<AlbumsNewState> mapEventToState(AlbumsNewEvent event) async*{
    if(event is GetAlbumsEvent) {

      yield AlbumsLoading();

      final failureOrAlbums = await getAlbumsUseCase(Params(number: event.userId));


      yield* _eitherLoadedOrErrorState(failureOrAlbums);


    }

  }


  Stream<AlbumsNewState> _eitherLoadedOrErrorState( Either<Failure,List<AlbumsEntity>> failureOrAlbums) async*{

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






import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/errors/map_failure_to_message.dart';
import 'package:tdd_eds/core/usecase/usecases.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/entities/photos_entity.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/usecase/get_photos_usecase.dart';

part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc({ required this.getUseCase}) : super(PhotosInitial());


  final GetPhotosUseCase getUseCase ;

  @override
  Stream<PhotosState> mapEventToState(PhotosEvent event) async*{
    if(event is GetPhotos) {

      yield Loading();

      final failureOrAlbums = await getUseCase(Params(number: event.albumId));


      yield* _eitherLoadedOrErrorState(failureOrAlbums);


    }

  }



  Stream<PhotosState> _eitherLoadedOrErrorState( Either<Failure,List<PhotosEntity>> failureOrPhotos) async*{

    yield failureOrPhotos.fold(
            (failure) => LoadingError(mapFailureToMessage(failure)),
            (data) => Loaded(data));
  }
}

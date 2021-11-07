part of 'photos_bloc.dart';

abstract class PhotosState extends Equatable {
  const PhotosState();
  @override
  List<Object> get props => [];
}

class PhotosInitial extends PhotosState {

}

class Loading extends PhotosState {}

class Loaded extends PhotosState {

  final List<PhotosEntity> entity;

  const Loaded(this.entity);


  @override
  List<Object> get props => [entity];
}

class LoadingError extends PhotosState {


  final String message;

  const LoadingError(this.message);



  @override
  List<Object> get props => [message];
}

part of 'albums_new_bloc.dart';

abstract class AlbumsNewState extends Equatable {
  const AlbumsNewState();

  @override
  List<Object> get props => [];
}

class AlbumsNewInitial extends AlbumsNewState {

}


class AlbumsLoading extends AlbumsNewState {}

class AlbumsLoaded extends AlbumsNewState {

  final List<AlbumsEntity> albumsEntity;

  const AlbumsLoaded(this.albumsEntity);


  @override
  List<Object> get props => [albumsEntity];
}

class AlbumsLoadingError extends AlbumsNewState {


  final String message;

  const AlbumsLoadingError(this.message);



  @override
  List<Object> get props => [message];
}

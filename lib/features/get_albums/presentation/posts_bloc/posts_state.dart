part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();
  @override
  List<Object> get props => [];
}

class PostsInitial extends PostsState {

}
class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {

  final List<PostsEntity> postsEntity;

  const PostsLoaded(this.postsEntity);


  @override
  List<Object> get props => [postsEntity];
}

class PostsLoadingError extends PostsState {


  final String message;

  const PostsLoadingError(this.message);



  @override
  List<Object> get props => [message];
}

part of 'comments_bloc.dart';

abstract class CommentsState extends Equatable {
  const CommentsState();

  @override
  List<Object> get props => [];
}

class CommentsInitial extends CommentsState {

}
class Loading extends CommentsState {}

class Loaded extends CommentsState {

  final List<CommentsEntity> entity;

  const Loaded(this.entity);


  @override
  List<Object> get props => [entity];
}

class LoadingError extends CommentsState {


  final String message;

  const LoadingError(this.message);



  @override
  List<Object> get props => [message];
}


part of 'comments_bloc.dart';

abstract class CommentsEvent extends Equatable {
  const CommentsEvent();
  @override
  List<Object> get props=> [];
}


class GetCommentsEvents extends CommentsEvent{

final int postId;

  const GetCommentsEvents({required this.postId});

  @override
  List<Object> get props=> [postId];
}
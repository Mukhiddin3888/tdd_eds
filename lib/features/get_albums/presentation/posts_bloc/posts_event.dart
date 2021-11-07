part of 'posts_bloc.dart';

abstract class PostsEvent extends Equatable {
  const PostsEvent();


  @override
  List<Object> get props=> [];
}


class GetPostsEvent extends PostsEvent{
  final int userId;

  const GetPostsEvent({required this.userId});


  @override
  List<Object> get props=> [userId];
}

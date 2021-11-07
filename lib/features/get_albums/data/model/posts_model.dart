


import 'package:tdd_eds/features/get_albums/domain/entities/posts_entity.dart';

class UserPostsModel extends PostsEntity {

  const UserPostsModel({
    required int id,
    required int userId,
    required String title,
    required String body
  }) : super(id: id, userId: userId, title: title, body: body);


  factory UserPostsModel.fromJson( Map<String, dynamic> json ){
    return UserPostsModel(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        body: json["body"]

    );
  }



}



import 'package:tdd_eds/features/get_comments_and_photos/domain/entities/comments_entity.dart';

class CommentsModel extends CommentsEntity{


  const CommentsModel({
    required int postId,
    required int id,
    required String name,
    required String email,
    required String body}) : super(postId: postId, id: id, name: name, email: email, body: body) ;


  factory CommentsModel.fromJson(Map<String, dynamic> json){
    return CommentsModel(
        postId: json["postId"],
        id: json["id"],
        name: json["name"],
        email: json["email"],
        body: json["body"]
    );
  }
  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,

  };



}
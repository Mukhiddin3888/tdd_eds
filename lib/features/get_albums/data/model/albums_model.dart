



import 'package:tdd_eds/features/get_albums/domain/entities/albums_entity.dart';

class AlbumsModel extends AlbumsEntity {

  const AlbumsModel({
    required int userId,
    required int id,
    required String title}) : super(userId: userId, id: id,title: title);

  factory AlbumsModel.fromJson(Map<String, dynamic> json){
    return AlbumsModel(
        userId: json["userId"] ,
        id: json["id"] ,
        title: json["title"] ,
    );
  }

  Map<String, dynamic> toJson(){

    return {
      "userId": userId,
      "id": id,
      "title": title
    };
  }


}
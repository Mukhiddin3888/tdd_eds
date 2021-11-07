import 'package:tdd_eds/features/get_comments_and_photos/domain/entities/photos_entity.dart';

class PhotosModel extends PhotosEntity {



 const PhotosModel({
    required int albumId,
    required int id,
    required String title,
    required String url,
    required String thumbnailUrl,

  }) : super(id: id, albumId: albumId, title: title, url: url, thumbnailUrl: thumbnailUrl);

  factory PhotosModel.fromJson(Map<String, dynamic> json){
    return PhotosModel(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"]
    );
  }



}
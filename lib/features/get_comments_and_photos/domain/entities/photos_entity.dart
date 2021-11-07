import 'package:equatable/equatable.dart';

class PhotosEntity extends Equatable {

  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const PhotosEntity({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,

  });

  @override
  List<Object> get props => [ albumId,id, title, url, thumbnailUrl];


}
import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/entities/photos_entity.dart';


abstract class PhotosRepository{

  Future<Either<Failure, List<PhotosEntity>>> getPhotos(int albumId);

}
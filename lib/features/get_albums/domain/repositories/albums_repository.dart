


import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/albums_entity.dart';


abstract class AlbumsRepository{

  Future<Either<Failure, List<AlbumsEntity>>> getAlbums(int userId);

}
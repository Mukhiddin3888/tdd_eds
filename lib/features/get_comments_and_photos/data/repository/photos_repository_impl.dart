

import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/network_info/network_info.dart';
import 'package:tdd_eds/features/get_comments_and_photos/data/data_sources/photos_remote_data_source.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/entities/photos_entity.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/repositories/photos_repository.dart';





class PhotosRepositoryImpl implements PhotosRepository{

  final PhotosRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  PhotosRepositoryImpl({ required this.remoteDataSource, required this.networkInfo});


  @override
  Future<Either<Failure, List<PhotosEntity>>> getPhotos(int albumId) async {
    if(await networkInfo.isConnected){

      try{
        final remoteData = await remoteDataSource.getInfo(albumId);

        return Right(remoteData);

      }on ServerException{
        return Left(ServerFailure());
      }

    }else{

      return Left(CacheFailure());


    }
  }


}


import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/network_info/network_info.dart';
import 'package:tdd_eds/features/get_albums/data/data_sources/albums_local_data_source.dart';
import 'package:tdd_eds/features/get_albums/data/data_sources/albums_remote_data_source.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/albums_entity.dart';
import 'package:tdd_eds/features/get_albums/domain/repositories/albums_repository.dart';



class AlbumsRepositoryImpl implements AlbumsRepository{

  final AlbumsRemoteDataSource remoteDataSource;
  final AlbumsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  AlbumsRepositoryImpl({ required this.remoteDataSource,
    required this.networkInfo, required this.localDataSource});

  @override
  Future<Either<Failure, List<AlbumsEntity>>> getAlbums(int userId) async {
    if(await networkInfo.isConnected){

      try{
        final remoteAlbums = await remoteDataSource.getAlbums(userId);
        localDataSource.cachePosts(remoteAlbums, userId);
        return Right(remoteAlbums);

      }on ServerException{
        return Left(ServerFailure());
      }

    }else{
      try{
        final List localData =  localDataSource.getLastAlbums(userId);
        return Right(localData  as List<AlbumsEntity>);
      } on CacheException{
        return Left(CacheFailure());
      }
    }

  }


}
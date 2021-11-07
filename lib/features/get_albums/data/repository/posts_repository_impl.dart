

import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/network_info/network_info.dart';
import 'package:tdd_eds/features/get_albums/data/data_sources/posts_local_data_source.dart';
import 'package:tdd_eds/features/get_albums/data/data_sources/posts_remote_data_source.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/posts_entity.dart';
import 'package:tdd_eds/features/get_albums/domain/repositories/posts_repository.dart';

class PostsRepositoryImp implements PostsRepository{
  final PostsRemoteDataSource remoteDataSource;
  final PostsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostsRepositoryImp({required this.remoteDataSource,
    required this.networkInfo, required this.localDataSource});

  @override
  Future<Either<Failure, List<PostsEntity>>> getPosts(int userId) async {

    if(await networkInfo.isConnected){

      try{
        final remotePosts = await remoteDataSource.getPosts(userId);
        localDataSource.cachePosts(remotePosts, userId);

        return Right(remotePosts);

      }on ServerException{
        return Left(ServerFailure());
      }

    }else{
      try{
        final localTrivia = await localDataSource.getLastPosts(userId);
        return Right(localTrivia as List<PostsEntity>);
      } on CacheException{
        return Left(CacheFailure());
      }

    }

  }
}


import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/network_info/network_info.dart';
import 'package:tdd_eds/features/get_comments_and_photos/data/data_sources/comments_remote_data_source.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/entities/comments_entity.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/repositories/comments_repository.dart';





class CommentsRepositoryImpl implements CommentsRepository{

  final CommentsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  CommentsRepositoryImpl({ required this.remoteDataSource, required this.networkInfo});


  @override
  Future<Either<Failure, List<CommentsEntity>>> getComments(int postId) async {
    if(await networkInfo.isConnected){

      try{
        final remoteData = await remoteDataSource.getInfo(postId);

        return Right(remoteData);

      }on ServerException{
        return Left(ServerFailure());
      }

    }else{

      return Left(CacheFailure());


    }
  }


}


import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/network_info/network_info.dart';
import 'package:tdd_eds/features/get_users/data/data_sources/users_local_data_source.dart';
import 'package:tdd_eds/features/get_users/data/data_sources/userss_remote_data_source.dart';
import 'package:tdd_eds/features/get_users/domain/repositories/users_repository.dart';




class UsersRepositoryImpl implements UsersRepository{

  final UsersRemoteDataSource remoteDataSource;
  final UsersLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  UsersRepositoryImpl({ required this.remoteDataSource,
    required this.networkInfo, required this.localDataSource});


  @override
  Future<Either<Failure, List>> getUsers() async {
    if(await networkInfo.isConnected){

      try{
        final remoteUsers = await remoteDataSource.getUsers();
        localDataSource.cacheData(remoteUsers);

        return Right(remoteUsers);

      }on ServerException{
        return Left(ServerFailure());
      }

    }else{
      try{
        final localData =  localDataSource.getLastData();
        return Right(localData);
      } on CacheException{
        return Left(CacheFailure());
      }

    }
  }


}
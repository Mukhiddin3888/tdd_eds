

import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/network_info/network_info.dart';
import 'package:tdd_eds/features/get_albums/data/data_sources/albums_remote_data_source.dart';
import 'package:tdd_eds/features/get_albums/data/model/albums_model.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/albums_entity.dart';
import 'package:tdd_eds/features/get_albums/domain/repositories/albums_repository.dart';



typedef Future<List<AlbumsModel>> _ConcreteOrRandomChooser();

class AlbumsRepositoryImpl implements AlbumsRepository{

  final AlbumsRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  AlbumsRepositoryImpl({ required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<AlbumsEntity>>> getAlbums(int userId) async {
    return _getTrivia(() => remoteDataSource.getAlbums(userId));
  }


  Future<Either<Failure, List<AlbumsEntity>>> _getTrivia (
      _ConcreteOrRandomChooser concreteOrRandomChooser
      )async{
    if(await networkInfo.isConnected){

      try{
        final remoteTrivia = await concreteOrRandomChooser();

        return Right(remoteTrivia);

      }on ServerException{
        return Left(ServerFailure());
      }

    }else{

        return Left(CacheFailure());


    }
  }


}
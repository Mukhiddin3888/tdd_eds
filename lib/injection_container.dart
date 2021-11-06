

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tdd_eds/core/network_info/network_info.dart';
import 'package:tdd_eds/features/get_albums/domain/repositories/albums_repository.dart';

import 'features/get_albums/data/data_sources/albums_remote_data_source.dart';
import 'features/get_albums/data/repository/repository_impl.dart';
import 'features/get_albums/domain/usecase/get_albums_usecase.dart';
import 'features/get_albums/presentation/bloc/albums_new_bloc.dart';

final sl = GetIt.instance;

Future<void> init()  async {


  // features Albums

  // Bloc
  
  sl.registerFactory<AlbumsNewBloc>(() => AlbumsNewBloc(getAlbumsUseCase: sl()));

  // Use cases
  
  sl.registerLazySingleton(() => GetAlbumsUseCase(albumsRepository: sl()));


  //repository
  
  sl.registerLazySingleton<AlbumsRepository>(
          () => AlbumsRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // data sources

  sl.registerLazySingleton<AlbumsRemoteDataSource> (() => AlbumsRemoteDataSourceImpl(dio: sl()));

  //core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => InternetConnectionChecker());




}
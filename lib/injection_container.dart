

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:tdd_eds/core/network_info/network_info.dart';
import 'package:tdd_eds/features/get_albums/data/data_sources/posts_remote_data_source.dart';
import 'package:tdd_eds/features/get_albums/data/repository/posts_repository_impl.dart';
import 'package:tdd_eds/features/get_albums/domain/repositories/albums_repository.dart';
import 'package:tdd_eds/features/get_albums/domain/repositories/posts_repository.dart';
import 'package:tdd_eds/features/get_albums/domain/usecase/get_posts.dart';
import 'package:tdd_eds/features/get_albums/presentation/posts_bloc/posts_bloc.dart';
import 'package:tdd_eds/features/get_users/data/data_sources/userss_remote_data_source.dart';
import 'package:tdd_eds/features/get_users/domain/repositories/users_repository.dart';
import 'package:tdd_eds/features/get_users/domain/usecase/get_users_usecase.dart';
import 'package:tdd_eds/features/get_users/presentation/bloc/users_bloc.dart';

import 'features/get_albums/data/data_sources/albums_remote_data_source.dart';
import 'features/get_albums/data/repository/repository_impl.dart';
import 'features/get_albums/domain/usecase/get_albums_usecase.dart';
import 'features/get_albums/presentation/bloc/albums_new_bloc.dart';
import 'features/get_users/data/repository/repository_impl.dart';

final sl = GetIt.instance;

Future<void> init()  async {


  /// features get Albums and Posts

  // Bloc
  
  sl.registerFactory<AlbumsNewBloc>(() => AlbumsNewBloc(getAlbumsUseCase: sl()));
  sl.registerFactory<PostsBloc>(() => PostsBloc(getPostsUseCase: sl()));

  // Use cases
  
  sl.registerLazySingleton(() => GetAlbumsUseCase(albumsRepository: sl()));
  sl.registerLazySingleton(() => GetPostsUseCase(postsRepository: sl()));


  //repository
  
  sl.registerLazySingleton<AlbumsRepository>(
          () => AlbumsRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<PostsRepository>(
          () => PostsRepositoryImp(remoteDataSource: sl(), networkInfo: sl()));

  // data sources

  sl.registerLazySingleton<AlbumsRemoteDataSource> (() => AlbumsRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<PostsRemoteDataSource> (() => PostsRemoteDataSourceImpl(dio: sl()));

  //core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => InternetConnectionChecker());


  /// features get Users

  // Bloc

  sl.registerFactory<UsersBloc>(() => UsersBloc(getUsersUseCase: sl()));

  // Use cases

  sl.registerLazySingleton(() => GetUsersUseCase(usersRepository: sl()));


  //repository

  sl.registerLazySingleton<UsersRepository>(
          () => UsersRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // data sources

  sl.registerLazySingleton<UsersRemoteDataSource> (() => UsersRemoteDataSourceImpl(dio: sl()));




}
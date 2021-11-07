

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tdd_eds/core/network_info/network_info.dart';
import 'package:tdd_eds/features/get_albums/data/data_sources/albums_local_data_source.dart';
import 'package:tdd_eds/features/get_albums/data/data_sources/posts_local_data_source.dart';
import 'package:tdd_eds/features/get_albums/data/data_sources/posts_remote_data_source.dart';
import 'package:tdd_eds/features/get_albums/data/repository/posts_repository_impl.dart';
import 'package:tdd_eds/features/get_albums/domain/repositories/albums_repository.dart';
import 'package:tdd_eds/features/get_albums/domain/repositories/posts_repository.dart';
import 'package:tdd_eds/features/get_albums/domain/usecase/get_posts.dart';
import 'package:tdd_eds/features/get_albums/presentation/posts_bloc/posts_bloc.dart';
import 'package:tdd_eds/features/get_comments_and_photos/data/data_sources/comments_remote_data_source.dart';
import 'package:tdd_eds/features/get_comments_and_photos/data/data_sources/photos_remote_data_source.dart';
import 'package:tdd_eds/features/get_comments_and_photos/data/repository/photos_repository_impl.dart';
import 'package:tdd_eds/features/get_comments_and_photos/data/repository/repository_impl.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/repositories/comments_repository.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/repositories/photos_repository.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/usecase/get_photos_usecase.dart';
import 'package:tdd_eds/features/get_comments_and_photos/presentation/comments_bloc/comments_bloc.dart';
import 'package:tdd_eds/features/get_comments_and_photos/presentation/photos_bloc/photos_bloc.dart';
import 'package:tdd_eds/features/get_users/data/data_sources/users_local_data_source.dart';
import 'package:tdd_eds/features/get_users/data/data_sources/userss_remote_data_source.dart';
import 'package:tdd_eds/features/get_users/domain/repositories/users_repository.dart';
import 'package:tdd_eds/features/get_users/domain/usecase/get_users_usecase.dart';
import 'package:tdd_eds/features/get_users/presentation/bloc/users_bloc.dart';

import 'features/get_albums/data/data_sources/albums_remote_data_source.dart';
import 'features/get_albums/data/repository/repository_impl.dart';
import 'features/get_albums/domain/usecase/get_albums_usecase.dart';
import 'features/get_albums/presentation/bloc/albums_new_bloc.dart';
import 'features/get_comments_and_photos/domain/usecase/get_comments_usecase.dart';
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
          () => AlbumsRepositoryImpl(remoteDataSource: sl(), networkInfo: sl(), localDataSource: sl()));

  sl.registerLazySingleton<PostsRepository>(
          () => PostsRepositoryImp(remoteDataSource: sl(), networkInfo: sl(), localDataSource: sl()));

  // data sources

  sl.registerLazySingleton<AlbumsRemoteDataSource> (() => AlbumsRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<AlbumsLocalDataSource>(() => AlbumsLocalDataSourceImpl());

  sl.registerLazySingleton<PostsRemoteDataSource> (() => PostsRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<PostsLocalDataSource>(() => PostsLocalDataSourceImpl());

  //core

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  sl.registerLazySingleton(() => Dio());

  sl.registerLazySingleton(() => InternetConnectionChecker());

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  
  sl.registerLazySingleton(() => Hive);
  
 


  /// features get Users

  // Bloc

  sl.registerFactory<UsersBloc>(() => UsersBloc(getUsersUseCase: sl()));

  // Use cases

  sl.registerLazySingleton(() => GetUsersUseCase(usersRepository: sl()));


  //repository

  sl.registerLazySingleton<UsersRepository>(
          () => UsersRepositoryImpl(remoteDataSource: sl(), networkInfo: sl(), localDataSource: sl()));

  // data sources

  sl.registerLazySingleton<UsersRemoteDataSource> (() => UsersRemoteDataSourceImpl(dio: sl()));
  sl.registerLazySingleton<UsersLocalDataSource>(() => UsersLocalDataSourceImpl());

 /// features get Comments and Photos

  // Bloc

  sl.registerFactory<CommentsBloc>(() => CommentsBloc( getUseCase: sl()));
  sl.registerFactory<PhotosBloc>(() => PhotosBloc( getUseCase: sl()));

  // Use cases

  sl.registerLazySingleton(() => GetCommentsUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetPhotosUseCase(repository: sl()));


  //repository

  sl.registerLazySingleton<CommentsRepository>(
          () => CommentsRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<PhotosRepository>(
          () => PhotosRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()));

  // data sources

  sl.registerLazySingleton<CommentsRemoteDataSource> (() => CommentsRemoteDataSourceImpl(dio: sl()));

  sl.registerLazySingleton<PhotosRemoteDataSource> (() => PhotosRemoteDataSourceImpl(dio: sl()));


}
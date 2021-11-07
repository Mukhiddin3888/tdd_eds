


import 'package:dio/dio.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/features/get_albums/data/model/posts_model.dart';



abstract class PostsRemoteDataSource{


  Future<List<UserPostsModel>> getPosts(int userId);
}

class PostsRemoteDataSourceImpl implements PostsRemoteDataSource{


  Dio dio = Dio();

  PostsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<UserPostsModel>> getPosts(int userId) => _getPostsFromUrl('https://jsonplaceholder.typicode.com/posts?userId=$userId');

  Future<List<UserPostsModel>> _getPostsFromUrl( url)async{



    final response =  await dio.get(url);

    if(response.statusCode == 200){
      List<UserPostsModel> posts = (response.data as List)
          .map(
            (e) => UserPostsModel.fromJson(e as Map<String, dynamic>),
      )
          .toList();
      return posts ;
    }else{
      throw ServerException();
    }

  }



}




import 'package:dio/dio.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/features/get_comments_and_photos/data/model/comments_model.dart';



abstract class CommentsRemoteDataSource{


  Future<List<CommentsModel>> getInfo(int postId);
}

class CommentsRemoteDataSourceImpl implements CommentsRemoteDataSource{


  Dio dio = Dio();

  CommentsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<CommentsModel>> getInfo(int postId) => _getDataFromUrl('https://jsonplaceholder.typicode.com/comments?postId=$postId');

  Future<List<CommentsModel>> _getDataFromUrl( url)async{



    final response =  await dio.get(url);

    if(response.statusCode == 200){
      List<CommentsModel> data = (response.data as List)
          .map(
            (e) => CommentsModel.fromJson(e as Map<String, dynamic>),
      )
          .toList();
      return data ;
    }else{
      throw ServerException();
    }

  }



}

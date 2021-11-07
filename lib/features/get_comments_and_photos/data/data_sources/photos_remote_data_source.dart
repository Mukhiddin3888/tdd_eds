


import 'package:dio/dio.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/features/get_comments_and_photos/data/model/photos_model.dart';



abstract class PhotosRemoteDataSource{


  Future<List<PhotosModel>> getInfo(int albumId);
}

class PhotosRemoteDataSourceImpl implements PhotosRemoteDataSource{


  Dio dio = Dio();

  PhotosRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<PhotosModel>> getInfo(int albumId) => _getDataFromUrl('https://jsonplaceholder.typicode.com/photos?albumId=$albumId');

  Future<List<PhotosModel>> _getDataFromUrl( url)async{



    final response =  await dio.get(url);

    if(response.statusCode == 200){
      List<PhotosModel> data = (response.data as List)
          .map(
            (e) => PhotosModel.fromJson(e as Map<String, dynamic>),
      )
          .toList();
      return data ;
    }else{
      throw ServerException();
    }

  }



}

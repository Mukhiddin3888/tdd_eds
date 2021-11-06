


import 'package:dio/dio.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/features/get_albums/data/model/albums_model.dart';



abstract class AlbumsRemoteDataSource{


  Future<List<AlbumsModel>> getAlbums(int userId);
}

class AlbumsRemoteDataSourceImpl implements AlbumsRemoteDataSource{

  //final http.Client client;
  Dio dio = Dio();

  AlbumsRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<AlbumsModel>> getAlbums(int userId) => _getAlbumsFromUrl('https://jsonplaceholder.typicode.com/albums?userId=$userId');

  Future<List<AlbumsModel>> _getAlbumsFromUrl( url)async{


  //  final response =  await client.get(Uri.parse(url), headers: { "Content-Type": 'application/json'});
    final response =  await dio.get(url);

    if(response.statusCode == 200){
      List<AlbumsModel> albums = (response.data as List)
          .map(
            (e) => AlbumsModel.fromJson(e as Map<String, dynamic>),
      )
          .toList();
      return albums ;
    }else{
      throw ServerException();
    }

  }



}

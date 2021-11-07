


import 'package:dio/dio.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/features/get_users/data/model/users_model.dart';



abstract class UsersRemoteDataSource{


  Future<List<UsersModel>> getUsers();
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource{


  Dio dio = Dio(BaseOptions(
    connectTimeout: 35000,
    receiveTimeout: 33000,
    followRedirects: false,
  ));

  UsersRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<UsersModel>> getUsers() => _getUsersFromUrl('https://jsonplaceholder.typicode.com/users');

  Future<List<UsersModel>> _getUsersFromUrl( url)async{



    final response =  await dio.get(url);

    if(response.statusCode == 200){
      List<UsersModel> users = (response.data as List)
          .map(
            (e) => UsersModel.fromJson(e as Map<String, dynamic>),
      )
          .toList();
      return users ;
    }else{
      throw ServerException();
    }

  }



}

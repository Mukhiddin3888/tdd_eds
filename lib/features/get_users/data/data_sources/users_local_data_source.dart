


import 'package:hive/hive.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/core/storage/hive.dart';

abstract class UsersLocalDataSource {

  List getLastData();

  Future<void> cacheData(List usersToCache);

}


class UsersLocalDataSourceImpl implements UsersLocalDataSource{

  @override
  Future<void> cacheData(List<dynamic> usersToCache) {
    return HiveStoreMe.putData(boxName: 'users', keyWord: 'user', data: usersToCache);
  }

  @override
  List getLastData() {
    var ldata =  Hive.box<List>('users').get('user') ;

    if(ldata != null){
      return ldata;
    }else{
      throw CacheException();
    }
  }

}

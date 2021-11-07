


import 'package:hive/hive.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/core/storage/hive.dart';

abstract class PostsLocalDataSource{


  List getLastPosts(int userId);

  Future<void> cachePosts(List postsToCache, int userId);

}


class PostsLocalDataSourceImpl implements PostsLocalDataSource {



  @override
  Future<void> cachePosts(List postsToCache, int userId) {
   return HiveStoreMe.putData(boxName: 'albums', keyWord: 'album$userId', data: postsToCache);

  }

  @override
  List getLastPosts(int userId) {
    var ldata =  Hive.box<List>('albums').get('album$userId') ;

    if(ldata != null){
      return ldata;
    }else{
      throw CacheException();
    }
  }

}

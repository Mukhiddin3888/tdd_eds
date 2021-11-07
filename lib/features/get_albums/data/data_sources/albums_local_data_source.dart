


import 'package:hive/hive.dart';
import 'package:tdd_eds/core/errors/exeptions.dart';
import 'package:tdd_eds/core/storage/hive.dart';

abstract class AlbumsLocalDataSource {

  List getLastAlbums(int albumId);

  Future<void> cachePosts(List albumsToCache, int userId);

}


class AlbumsLocalDataSourceImpl implements AlbumsLocalDataSource{
  @override
  Future<void> cachePosts(List<dynamic> albumsToCache, int userId) {
    return HiveStoreMe.putData(boxName: 'albums', keyWord: 'album$userId', data: albumsToCache);
  }

  @override
  List getLastAlbums(int albumId) {
    var ldata =  Hive.box<List>('albums').get('album$albumId') ;

    if(ldata != null){
      return ldata;
    }else{
      throw CacheException();
    }
  }

}
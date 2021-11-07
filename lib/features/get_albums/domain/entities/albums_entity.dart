

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'albums_entity.g.dart';

@HiveType(typeId: 1)
class AlbumsEntity extends Equatable{

  @HiveField(0)
  final int userId;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;

 const AlbumsEntity({required this.userId, required this.id, required this.title});



  @override
  List<Object> get props => [userId, id,title];
}
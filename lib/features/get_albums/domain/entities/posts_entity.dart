import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'posts_entity.g.dart';

@HiveType(typeId: 0)
class PostsEntity extends Equatable{


  @HiveField(0)
  final int userId;
  @HiveField(1)
  final int id;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String body;

  const PostsEntity({required this.userId, required this.id, required this.title, required this.body});



  @override
  List<Object> get props => [userId, id,title, body];
}


import 'package:equatable/equatable.dart';

class AlbumsEntity extends Equatable{

  final int userId;
  final int id;
  final String title;

 const AlbumsEntity({required this.userId, required this.id, required this.title});



  @override
  List<Object> get props => [userId, id,title];
}
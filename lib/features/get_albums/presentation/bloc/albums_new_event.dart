part of 'albums_new_bloc.dart';

abstract class AlbumsNewEvent extends Equatable {
  const AlbumsNewEvent();


  @override
  List<Object> get props=> [];
}
class GetAlbumsEvent extends AlbumsNewEvent{
  final int userId;

  GetAlbumsEvent({required this.userId});


  @override
  List<Object> get props=> [userId];
}
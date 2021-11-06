part of 'users_bloc.dart';

abstract class UsersState extends Equatable {
  const UsersState();
  @override
  List<Object> get props => [];

}

class UsersInitial extends UsersState {}

class UsersLoading extends UsersState {}

class UsersLoaded extends UsersState {

  final List<UsersEntity> usersEntity;

  const UsersLoaded({required this.usersEntity});


  @override
  List<Object> get props => [usersEntity];
}

class UsersLoadingError extends UsersState {


  final String message;

  const UsersLoadingError(this.message);



  @override
  List<Object> get props => [message];
}
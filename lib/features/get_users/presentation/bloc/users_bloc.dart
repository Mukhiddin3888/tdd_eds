import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/usecase/usecases.dart';
import 'package:tdd_eds/features/get_users/domain/entities/users_info_entity.dart';
import 'package:tdd_eds/features/get_users/domain/usecase/get_users_usecase.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({required this.getUsersUseCase}) : super(UsersInitial());


  final GetUsersUseCase getUsersUseCase ;

  @override
  Stream<UsersState> mapEventToState(UsersEvent event) async*{
    if(event is GetUsersEvent) {

      yield UsersLoading();

      final failureOrUsers = await getUsersUseCase(NoParams());


      yield* _eitherLoadedOrErrorState(failureOrUsers);


    }

  }


  Stream<UsersState> _eitherLoadedOrErrorState( Either<Failure,List<UsersEntity>> failureOrUsers) async*{

    yield failureOrUsers.fold(
            (failure) => UsersLoadingError(_mapFailureToMessage(failure)),
            (users) => UsersLoaded(usersEntity: users));
  }

  String _mapFailureToMessage(Failure failure){
    switch (failure.runtimeType){
      case ServerFailure:
        return 'Server Failure';

      case CacheFailure:
        return "Cache Failure";

      default:
        return "UnExpected Error";
    }
  }
}

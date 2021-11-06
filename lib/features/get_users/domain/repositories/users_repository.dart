


import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/features/get_users/domain/entities/users_info_entity.dart';


abstract class UsersRepository{

  Future<Either<Failure, List<UsersEntity>>> getUsers();

}
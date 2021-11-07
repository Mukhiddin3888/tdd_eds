


import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/failure.dart';


abstract class UsersRepository{

  Future<Either<Failure, List>> getUsers();

}
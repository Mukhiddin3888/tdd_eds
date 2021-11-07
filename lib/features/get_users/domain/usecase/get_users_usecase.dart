



import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/usecase/usecases.dart';
import 'package:tdd_eds/features/get_users/domain/repositories/users_repository.dart';


class GetUsersUseCase implements UseCase<List, NoParams>{

final UsersRepository usersRepository;

GetUsersUseCase({ required this.usersRepository});

  @override
  Future<Either<Failure, List>> call(NoParams) async {

    return await usersRepository.getUsers();

  }
}








import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/usecase/usecases.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/entities/comments_entity.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/repositories/comments_repository.dart';



class GetCommentsUseCase implements UseCase<List<CommentsEntity>, Params>{

  final CommentsRepository repository;

  GetCommentsUseCase({ required this.repository});

  @override
  Future<Either<Failure, List<CommentsEntity>>> call(Params params) async {

    return await repository.getComments(params.number);

  }
}
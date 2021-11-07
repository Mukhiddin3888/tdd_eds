
import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/entities/comments_entity.dart';


abstract class CommentsRepository{

  Future<Either<Failure, List<CommentsEntity>>> getComments(int postId);

}
import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/posts_entity.dart';


abstract class PostsRepository{

  Future<Either<Failure, List<PostsEntity>>> getPosts(int userId);

}

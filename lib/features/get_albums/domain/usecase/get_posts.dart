



import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/usecase/usecases.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/posts_entity.dart';
import 'package:tdd_eds/features/get_albums/domain/repositories/posts_repository.dart';


class GetPostsUseCase implements UseCase<List<PostsEntity>, Params>{

  final PostsRepository postsRepository;

  GetPostsUseCase({ required this.postsRepository});

  @override
  Future<Either<Failure, List<PostsEntity>>> call(Params params) async {

    return await postsRepository.getPosts(params.number);

  }
}






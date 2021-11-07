import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/usecase/usecases.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/entities/photos_entity.dart';
import 'package:tdd_eds/features/get_comments_and_photos/domain/repositories/photos_repository.dart';



class GetPhotosUseCase implements UseCase<List<PhotosEntity>, Params>{

  final PhotosRepository repository;

  GetPhotosUseCase({ required this.repository});

  @override
  Future<Either<Failure, List<PhotosEntity>>> call(Params params) async {

    return await repository.getPhotos(params.number);

  }
}
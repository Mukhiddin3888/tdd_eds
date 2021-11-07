



import 'package:dartz/dartz.dart';
import 'package:tdd_eds/core/errors/failure.dart';
import 'package:tdd_eds/core/usecase/usecases.dart';
import 'package:tdd_eds/features/get_albums/domain/entities/albums_entity.dart';
import 'package:tdd_eds/features/get_albums/domain/repositories/albums_repository.dart';


class GetAlbumsUseCase implements UseCase<List<AlbumsEntity>, Params>{

final AlbumsRepository albumsRepository;

  GetAlbumsUseCase({ required this.albumsRepository});

  @override
  Future<Either<Failure, List<AlbumsEntity>>> call(Params params) async {

    return await albumsRepository.getAlbums(params.number);

  }
}

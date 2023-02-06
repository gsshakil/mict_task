import 'package:dartz/dartz.dart';
import 'package:mict_task/core/error/failure.dart';
import 'package:mict_task/domain/entities/video_entity.dart';
import 'package:mict_task/domain/repository/i_video_repository.dart';

class GetVideosUseCase {
  IVideoRepository videoRepository;

  GetVideosUseCase({required this.videoRepository});

  Future<Either<Failure, VideoEntity>> call() async {
    return await videoRepository.getVideos();
  }
}

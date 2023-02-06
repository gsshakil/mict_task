import 'package:dartz/dartz.dart';
import 'package:mict_task/core/error/exceptions.dart';
import 'package:mict_task/core/error/failure.dart';
import 'package:mict_task/data/data_sources/i_video_data_source.dart';
import 'package:mict_task/data/models/video_model.dart';
import 'package:mict_task/domain/entities/video_entity.dart';
import 'package:mict_task/domain/repository/i_video_repository.dart';

class VideoRepository extends IVideoRepository {
  IVideoDataSource videoDataSource;
  VideoRepository({required this.videoDataSource});

  @override
  Future<Either<Failure, VideoEntity>> getVideos() async {
    try {
      VideoModel result = await videoDataSource.getVideos();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.errorMessage, code: e.code));
    }
  }
}

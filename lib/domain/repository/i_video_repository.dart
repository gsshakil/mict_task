import 'package:dartz/dartz.dart';
import 'package:mict_task/core/error/failure.dart';
import 'package:mict_task/domain/entities/video_entity.dart';

abstract class IVideoRepository {
  Future<Either<Failure, VideoEntity>> getVideos();
}

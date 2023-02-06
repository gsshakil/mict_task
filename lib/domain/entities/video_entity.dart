import 'package:equatable/equatable.dart';
import 'package:mict_task/domain/entities/video_data_entity.dart';

class VideoEntity extends Equatable {
  final bool success;
  final List<VideoDataEntity> data;

  const VideoEntity({
    required this.success,
    required this.data,
  });

  @override
  List<Object?> get props => [
        success,
        data,
      ];
}

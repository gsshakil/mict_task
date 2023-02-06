import 'package:mict_task/data/models/video_data_model.dart';
import 'package:mict_task/domain/entities/video_entity.dart';

class VideoModel extends VideoEntity {
  const VideoModel({
    required super.success,
    required super.data,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        success: json["success"],
        data: List<VideoDataModel>.from(
            json["data"].map((x) => VideoDataModel.fromJson(x))),
      );
}

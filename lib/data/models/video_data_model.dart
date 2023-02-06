import 'package:mict_task/domain/entities/video_data_entity.dart';

class VideoDataModel extends VideoDataEntity {
  const VideoDataModel(
      {required super.id,
      required super.caption,
      required super.videoUrl,
      required super.createdAt});

  factory VideoDataModel.fromJson(Map<String, dynamic> json) => VideoDataModel(
        id: json["id"],
        caption: json["caption"],
        videoUrl: json["video_url"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caption": caption,
        "video_url": videoUrl,
        "created_at": createdAt.toIso8601String(),
      };
}

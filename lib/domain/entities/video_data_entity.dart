import 'package:equatable/equatable.dart';

class VideoDataEntity extends Equatable {
  final int id;
  final String caption;
  final String videoUrl;
  final DateTime createdAt;

  const VideoDataEntity({
    required this.id,
    required this.caption,
    required this.videoUrl,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        caption,
        videoUrl,
        createdAt,
      ];
}

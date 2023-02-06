import 'package:mict_task/data/models/video_model.dart';

abstract class IVideoDataSource {
  Future<VideoModel> getVideos();
}

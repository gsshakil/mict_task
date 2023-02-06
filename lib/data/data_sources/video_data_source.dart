import 'dart:convert';

import 'package:mict_task/core/api_endpoints.dart';
import 'package:mict_task/core/network/i_network_client.dart';
import 'package:mict_task/data/data_sources/i_video_data_source.dart';
import 'package:mict_task/data/models/video_model.dart';

class VideoDataSource implements IVideoDataSource {
  final INetworkClient networkClient;

  VideoDataSource({required this.networkClient});

  @override
  Future<VideoModel> getVideos() async {
    String result = await networkClient.get(
      paramas: const NetworkParams(endPoint: APIEndPoints.videoEndPoint),
    );
    VideoModel response = VideoModel.fromJson(json.decode(result));

    return response;
  }
}

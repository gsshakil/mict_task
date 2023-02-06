import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mict_task/core/constants/colors.dart';
import 'package:mict_task/domain/entities/video_data_entity.dart';
import 'package:mict_task/presentation/widgets/video_player_view.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  final VideoDataEntity data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: kCyanBgColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.caption,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            DateFormat('hh:mm a').format(data.createdAt),
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 5),
          VideoPlayerView(
            dataSourceType: DataSourceType.network,
            url: data.videoUrl,
          ),
        ],
      ),
    );
  }
}

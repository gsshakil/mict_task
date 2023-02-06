import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mict_task/core/constants/colors.dart';
import 'package:mict_task/core/di.dart';
import 'package:mict_task/presentation/blocs/video_bloc/video_bloc.dart';
import 'package:mict_task/presentation/widgets/video_card.dart';

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final videoBloc = injector<VideoBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Explore',
          style: TextStyle(color: kBlackColor),
        ),
        centerTitle: true,
        backgroundColor: kWhiteColor,
        leading: CircleAvatar(
          backgroundColor: kCyanBgColor,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.camera_alt,
              color: kBlackColor,
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            backgroundColor: kCyanBgColor,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: kBlackColor,
              ),
            ),
          ),
        ],
        elevation: 0,
      ),
      body: BlocProvider.value(
        value: videoBloc..add(GetVideos()),
        child: BlocBuilder<VideoBloc, VideoState>(
          builder: (context, state) {
            if (state is VideoLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is VideoError) {
              return Center(child: Text(state.errorMessage));
            } else if (state is VideoSuccess) {
              return RefreshIndicator(
                onRefresh: () async {
                  videoBloc.add(GetVideos());
                },
                child: ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    itemCount: state.videoEntity.data.length,
                    itemBuilder: (context, index) {
                      if (index == 0) return const SizedBox();
                      return VideoCard(
                        data: state.videoEntity.data[index],
                      );
                    }),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}

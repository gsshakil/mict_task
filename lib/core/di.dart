import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mict_task/core/network/i_network_client.dart';
import 'package:mict_task/core/network/network_client.dart';
import 'package:mict_task/data/data_sources/i_video_data_source.dart';
import 'package:mict_task/data/data_sources/video_data_source.dart';
import 'package:mict_task/data/repository/video_repository.dart';
import 'package:mict_task/domain/repository/i_video_repository.dart';
import 'package:mict_task/domain/use_cases/get_videos_usecase.dart';
import 'package:mict_task/presentation/blocs/video_bloc/video_bloc.dart';

final injector = GetIt.instance;

Future<void> injectDependencies() async {
  injector.registerLazySingleton<Dio>(() => Dio());

  injector.registerLazySingleton<INetworkClient>(
      () => NetworkClient(dio: injector()));

  injector.registerLazySingleton<IVideoDataSource>(
      () => VideoDataSource(networkClient: injector()));

  injector.registerLazySingleton<IVideoRepository>(
      () => VideoRepository(videoDataSource: injector()));

  injector.registerLazySingleton<GetVideosUseCase>(
      () => GetVideosUseCase(videoRepository: injector()));

  injector.registerLazySingleton<VideoBloc>(() => VideoBloc(
        getVideosUseCase: injector(),
      ));
}

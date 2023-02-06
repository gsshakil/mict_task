import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mict_task/core/error/failure.dart';
import 'package:mict_task/domain/entities/video_entity.dart';
import 'package:mict_task/domain/use_cases/get_videos_usecase.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final GetVideosUseCase getVideosUseCase;

  VideoBloc({required this.getVideosUseCase}) : super(VideoInitial()) {
    on<GetVideos>((event, emit) async {
      emit(VideoLoading());
      Either<Failure, VideoEntity> result = await getVideosUseCase();
      result.fold((l) => emit(VideoError(errorMessage: l.message)), (r) {
        emit(VideoSuccess(videoEntity: r));
      });
    });
  }
}

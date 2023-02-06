part of 'video_bloc.dart';

abstract class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

class VideoInitial extends VideoState {}

class VideoLoading extends VideoState {}

class VideoError extends VideoState {
  final String errorMessage;

  const VideoError({required this.errorMessage});
}

class VideoSuccess extends VideoState {
  final VideoEntity videoEntity;

  const VideoSuccess({required this.videoEntity});
}

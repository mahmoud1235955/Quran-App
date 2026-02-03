part of 'audio_cubit.dart';

@immutable
sealed class AudioState {}

final class AudioLoading extends AudioState {}

final class AudioPlay extends AudioState {
  final String url;
  AudioPlay({required this.url});
}

final class AudioPause extends AudioState {}

final class AudioSeek extends AudioState {}

final class AudioProgress extends AudioState {
  final Duration position;
  final Duration duration;
  final bool isPlaying;
  AudioProgress({
    required this.position,
    required this.duration,
    required this.isPlaying,
  });
}

final class AudioError extends AudioState {}

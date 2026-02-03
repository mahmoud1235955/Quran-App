import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'audio_state.dart';

class AudioCubit extends Cubit<AudioState> {
  static final player = AudioPlayer();

  Duration _currentPos = Duration.zero;
  Duration _totalDur = Duration.zero;
  bool _playing = false;

  AudioCubit() : super(AudioLoading()) {
    player.onPositionChanged.listen((p) {
      _currentPos = p;
      _updateProgress();
    });

    player.onDurationChanged.listen((d) {
      _totalDur = d;
      _updateProgress();
    });

    player.onPlayerStateChanged.listen((s) {
      _playing = s == PlayerState.playing;
      _updateProgress();
    });
  }

  void _updateProgress() {
    emit(
      AudioProgress(
        position: _currentPos,
        duration: _totalDur,
        isPlaying: _playing,
      ),
    );
  }

  void playAudio({required String url}) async {
    try {
      await player.play(UrlSource(url));
    } catch (e) {
      emit(AudioError());
    }
  }

  void audioPause() async => await player.pause();

  void audioSeek({required int seconds}) async {
    await player.seek(Duration(seconds: seconds));
  }
}

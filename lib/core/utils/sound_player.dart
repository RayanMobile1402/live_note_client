import 'package:flutter/cupertino.dart';
import 'package:flutter_sound/flutter_sound.dart';

enum PlayAudioFlag { start, stop }

class SoundPlayer {
  final FlutterSoundPlayer _player = FlutterSoundPlayer();

  bool isPlayingInitialized = false;

  PlayAudioFlag flag = PlayAudioFlag.stop;

  Future<void> _startPlaying(VoidCallback whenFinished, String path) async {
    flag = PlayAudioFlag.start;
    if (!isPlayingInitialized) return;
    await _player.startPlayer(
        fromURI: path, whenFinished: whenFinished, codec: Codec.aacMP4);
  }

  Future<void> _stopPlaying() async {
    flag = PlayAudioFlag.stop;
    if (!isPlayingInitialized) return;
    await _player.stopPlayer();
  }

  Future<void> togglePlaying(
      {required VoidCallback whenFinished, required String path}) async {
    if (flag == PlayAudioFlag.start) {
      await _stopPlaying();
    } else {
      await _startPlaying(whenFinished, path);
    }
  }

  void toggleFlag() {
    if (flag == PlayAudioFlag.start) {
      flag = PlayAudioFlag.stop;
    } else {
      flag = PlayAudioFlag.start;
    }
  }
}

import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:universal_io/io.dart';

enum RecordAudioFlag { start, stop, initial }

class SoundRecorder {
  FlutterSoundRecorder? _soundRecorder = FlutterSoundRecorder();
  String path = '';
  String fileName = '';

  bool isRecordingInitialize = false;
  RecordAudioFlag flag = RecordAudioFlag.initial;

  Future<void> init() async {
    await checkMicrophonePermission();

    isRecordingInitialize = true;
  }

  void dispose() {
    if (!isRecordingInitialize) {
      return;
    }
    _stopRecording();

    _soundRecorder!.dispositionStream();
    _soundRecorder = null;
  }

  Future<void> _startRecording() async {
    flag = RecordAudioFlag.start;
    if (!isRecordingInitialize) {
      return;
    }
    fileName =
        DateTime.now().toString().replaceAll(' ', '-').replaceAll(':', '-');
    path = await createRecordPath(fileName);
    await _soundRecorder!
        .startRecorder(toFile: path, codec: Codec.aacADTS)
        .then((final value) {})
        .onError((final error, final stackTrace) {
      print(error);
    });
  }

  Future<void> _stopRecording() async {
    flag = RecordAudioFlag.stop;
    if (!isRecordingInitialize) {
      return;
    }
    await _soundRecorder!.stopRecorder();
  }

  Future<void> toggleRecordStatus() async {
    print('_soundRecorder?.isStopped: ${_soundRecorder?.isStopped}');
    if (_soundRecorder!.isStopped) {
      await _startRecording();
    } else {
      await _stopRecording();
    }
  }

  Future<void> deleteSound() async {
    await _soundRecorder!.deleteRecord(fileName: fileName);
  }

  static Future<void> checkMicrophonePermission() async {
    final PermissionStatus status = await Permission.microphone.status;
    if (!status.isGranted) {
      await Permission.microphone.request();
    }
  }

  static Future<String> createRecordPath(final String fileName) async {
    final Directory appDocDir = await getApplicationDocumentsDirectory();
    final File outPutFile = File('${appDocDir.path}/$fileName.aac');

    return outPutFile.path;
  }
}

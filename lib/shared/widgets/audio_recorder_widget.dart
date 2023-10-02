import 'package:flutter/material.dart';
import 'package:flutter_nice_ui/flutter_nice_ui.dart';

import '../../core/utils/sound_player.dart';
import '../../core/utils/sound_recorder.dart';

class AudioRecorderWidget extends StatefulWidget {
  const AudioRecorderWidget({super.key});

  @override
  _AudioRecorderWidgetState createState() => _AudioRecorderWidgetState();
}

class _AudioRecorderWidgetState extends State<AudioRecorderWidget> {
  final recorder = SoundRecorder();
  final player = SoundPlayer();

  late RecordAudioFlag currentRecordFlag;
  late PlayAudioFlag currentPlayFlag;

  Map<String, dynamic>? file = {};

  _AudioRecorderWidgetState();

  @override
  void initState() {
    recorder.init();
    super.initState();
  }

  @override
  void dispose() {
    recorder.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) {
    currentRecordFlag = recorder.flag;
    currentPlayFlag = player.flag;

    return Container(
      height: 80,
      width: 250,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () async {
              if (currentRecordFlag == RecordAudioFlag.initial ||
                  currentRecordFlag == RecordAudioFlag.start) {
                await recorder.toggleRecordStatus();
                file!['path'] = recorder.path;
                file!['type'] = 101;

                setState(() {});
              } else if (currentRecordFlag == RecordAudioFlag.stop) {
                file!['path'] = recorder.path;
                file!['type'] = 101;
                await player.togglePlaying(
                  whenFinished: () {
                    setState(player.toggleFlag);
                  },
                  path: file!['path'],
                );

                setState(() {});
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(
                currentRecordFlag == RecordAudioFlag.initial
                    ? Icons.mic_rounded
                    : currentRecordFlag == RecordAudioFlag.start
                        ? Icons.stop_rounded
                        : currentPlayFlag == PlayAudioFlag.stop
                            ? Icons.play_arrow_rounded
                            : Icons.pause,
                color: Theme.of(context).colorScheme.primary,
                size: 30,
              ),
            ),
          ),
          const SizedBox(
            width: 50,
          ),
          if (currentRecordFlag == RecordAudioFlag.start)
            /*SpinKitThreeBounce(
              size: 30,
              color: GREEN,
            ),*/
            const SizedBox(
              width: 50,
            ),
          if (currentRecordFlag == RecordAudioFlag.stop)
            Expanded(
              child: FittedBox(
                child: NiceButton.flat(
                  text: 'Save',
                  onPressed: () {
                    Navigator.pop(context, file);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

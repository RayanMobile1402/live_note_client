import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

import '../../core/parameters/parameters.dart';
import '../models/file_model.dart';

class VoicePlayer extends StatefulWidget {
  final FileModel file;
  final bool isFromLibrary;
  final String? libraryCaption;

  const VoicePlayer(
    this.file, {
    super.key,
    this.isFromLibrary = false,
    this.libraryCaption,
  });

  @override
  _VoicePlayerState createState() => _VoicePlayerState();
}

class _VoicePlayerState extends State<VoicePlayer> {
  bool isPlaying = false;
  final AudioPlayer assetsAudioPlayer = AudioPlayer();

  bool isReady = false;
  final int assetType = 101;

  @override
  void initState() {
    playerInit();
    super.initState();
  }

  @override
  void dispose() {
    assetsAudioPlayer.dispose();
    super.dispose();
  }

  Future<void> playerInit() async {
    if (widget.file.fileInfo!.type != 101) {
      await assetsAudioPlayer.setUrl(
        widget.file.fullPath!,
        headers: Parameters.getHeader(),
      );
    } else {
      await assetsAudioPlayer.setFilePath(widget.file.fileContent!.path);
    }
    isReady = true;
    setState(() {});
  }

  @override
  Widget build(final BuildContext context) =>
      widget.isFromLibrary ? _isFromLibraryWidget() : _normalWidget();

  Widget _isFromLibraryWidget() => InkWell(
        onTap: () {
          setState(() {
            isPlaying ? assetsAudioPlayer.pause() : assetsAudioPlayer.play();
            isPlaying = !isPlaying;
          });
        },
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.only(
            bottom: 1.5,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    widget.libraryCaption!,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff333333),
                          fontSize: 18,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  child: isReady
                      ? Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: ClipOval(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary,
                                shape: BoxShape.circle,
                              ),
                              width: 40,
                              height: 40,
                              child: Align(
                                alignment: Alignment.center,
                                child: SvgPicture.asset(
                                  isPlaying
                                      ? 'assets/images/pause.svg'
                                      : 'assets/images/play.svg',
                                  width: 15,
                                  height: 15,
                                  color:
                                      Theme.of(context).colorScheme.background,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(),
                        ),
                )
              ],
            ),
          ),
        ),
      );

  Widget _normalWidget() => isReady
      ? Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: InkWell(
            onTap: () {
              setState(() {
                isPlaying ? assetsAudioPlayer.stop() : assetsAudioPlayer.play();
                isPlaying = !isPlaying;
              });
            },
            child: ClipOval(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                width: 40,
                height: 40,
                child: Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    isPlaying
                        ? 'assets/images/pause.svg'
                        : 'assets/images/play.svg',
                    width: 15,
                    height: 15,
                    color: Theme.of(context).colorScheme.background,
                  ),
                ),
              ),
            ),
          ),
        )
      : const SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(),
        );
}

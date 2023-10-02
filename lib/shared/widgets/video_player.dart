import 'package:flutter/material.dart';
import 'package:flutter_nice_ui/flutter_nice_ui.dart';
import 'package:video_player/video_player.dart';

import '../../core/parameters/parameters.dart';
import '../models/file_model.dart';

class RayanVideoPlayer extends StatefulWidget {
  final FileModel file;

  const RayanVideoPlayer(this.file, {super.key});

  @override
  _RayanVideoPlayerState createState() => _RayanVideoPlayerState();
}

class _RayanVideoPlayerState extends State<RayanVideoPlayer> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    videoPlayerController = widget.file.fileInfo!.type != 102
        ? VideoPlayerController.networkUrl(
            Uri(path: widget.file.fullPath),
            httpHeaders: Parameters.getHeader(),
          )
        : VideoPlayerController.file(widget.file.fileContent!);

    videoPlayerController.addListener(() {
      setState(() {});
    });
    videoPlayerController.setLooping(true);
    videoPlayerController.initialize().then((_) => setState(() {}));
    videoPlayerController.play();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const NiceText('Video'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: videoPlayerController.value.isInitialized
                  ? VideoPlayer(
                      videoPlayerController,
                    )
                  : const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20,
                        ),
                        NiceText('Loading Video...'),
                      ],
                    ),
            ),
          ),
        ),
      );
}

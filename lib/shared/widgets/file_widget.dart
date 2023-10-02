import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';
import '../models/file_model.dart';
import 'item_file_widget.dart';
import 'item_image_widget.dart';
import 'item_pdf_widget.dart';
import 'item_video_widget.dart';
import 'voice_player.dart';

class FileWidget extends StatelessWidget {
  final FileModel? file;

  const FileWidget(this.file, {super.key});

  @override
  Widget build(final BuildContext context) {
    late Widget widget;
    if (file == null) {
      widget = const SizedBox.shrink();
    } else if (file!.fullPath == null && file?.fileContent == null) {
      widget = const SizedBox.shrink();
    } else if (file!.fileInfo!.type == null) {
      widget = const SizedBox.shrink();
    } else {
      switch (Utils.getFileFormat(file!.fileInfo!.type)) {
        case FileFormat.memoryFile:
        case FileFormat.file:
          widget = ItemFileWidget(file!);
          break;
        case FileFormat.audio:
        case FileFormat.memoryVoice:
          widget = VoicePlayer(file!);

          break;
        case FileFormat.networkImage:
        case FileFormat.memoryImage:
          widget = ItemImageWidget(file!);
          break;
        case FileFormat.video:
        case FileFormat.memoryVideo:
          {
            if (Platform.isAndroid) {
              widget = ItemVideoWidget(file!);
            } else if (Platform.isIOS) {
              widget = ItemFileWidget(file!);
            }
          }
          break;
        case FileFormat.pdf:
        case FileFormat.memoryPdf:
          widget = ItemPDFWidget(file!);
          break;
      }
    }

    return widget;
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_compress/video_compress.dart';

import 'utils.dart';

class Compressor {
  final String filePath;

  Compressor(this.filePath);

  Future<File> compress() async {
    final fileFormat = Utils.getFileFormat(Utils.setFileType(filePath));
    File file;
    switch (fileFormat) {
      case FileFormat.video:
        {
          final MediaInfo? mediaInfo = await VideoCompress.compressVideo(
            filePath,
            quality: VideoQuality.Res640x480Quality,
            deleteOrigin: false,
            includeAudio: true,
          );

          if (mediaInfo != null) {
            file = mediaInfo.file!;
            debugPrint('mediaInfo.file.path :: ${mediaInfo.toJson()}');
          } else {
            debugPrint('mediaInfo.file.path is null :: null  ');
            file = File(filePath);
          }

          return file;
        }

      case FileFormat.networkImage:
        final Directory directory = await getApplicationDocumentsDirectory();
        final savePath =
            '${directory.path}/IMG_${DateTime.now().toString()}.jpg';
        file = File((await FlutterImageCompress.compressAndGetFile(
          filePath,
          savePath,
          quality: 88,
          format: CompressFormat.jpeg,
        ))!
            .path);

        return file;
      default:
        return File(filePath);
    }
  }
}

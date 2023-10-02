import 'package:flutter/material.dart';

import '../../core/parameters/parameters.dart';
import '../../core/utils/utils.dart';
import '../models/file_model.dart';

class ImageViewer extends StatelessWidget {
  final FileModel file;

  const ImageViewer(this.file, {super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Photo'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Utils.getFileFormat(file.fileInfo!.type) ==
                    FileFormat.networkImage
                ? Image.network(
                    file.fullPath!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                    headers: Parameters.getHeader(),
                  )
                : Image.file(
                    file.fileContent!,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.contain,
                  ),
          ),
        ),
      );
}

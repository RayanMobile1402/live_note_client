import 'package:flutter/material.dart';

import '../../core/parameters/parameters.dart';
import '../models/file_model.dart';
import 'image_viewer.dart';

class ItemImageWidget extends StatefulWidget {
  final FileModel file;

  const ItemImageWidget(this.file, {super.key});

  @override
  _ItemImageWidgetState createState() => _ItemImageWidgetState();
}

class _ItemImageWidgetState extends State<ItemImageWidget> {


  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (final context) => ImageViewer(widget.file),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: widget.file.fileInfo!.type != 100
              ? Image.network(
                  widget.file.fullPath!,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                  headers: Parameters.getHeader(),
                )
              : Image.file(
                  widget.file.fileContent!,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
        ),
      );
}

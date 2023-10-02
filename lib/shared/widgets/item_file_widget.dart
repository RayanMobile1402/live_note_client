import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/parameters/parameters.dart';
import '../../core/utils/utils.dart';
import '../models/file_model.dart';

class ItemFileWidget extends StatefulWidget {
  final FileModel file;
  final bool isVertical;

  const ItemFileWidget(this.file, {super.key, this.isVertical = false});

  @override
  _ItemFileWidgetState createState() => _ItemFileWidgetState();
}

class _ItemFileWidgetState extends State<ItemFileWidget> {
  @override
  Widget build(BuildContext context) => widget.file.fileInfo!.type != 103
      ? InkWell(
          onTap: () {
            Utils.downloader(
              context,
              widget.file.fullPath!,
              Parameters.getHeader(),
              Utils.getFileType(widget.file.fileInfo!.type!)!,
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ClipOval(
                  child: Container(
                    width: 40,
                    height: 40,
                    alignment: Alignment.center,
                    color: Theme.of(context).colorScheme.primary,
                    child: SvgPicture.asset(
                      'assets/images/download.svg',
                      width: 20,
                      height: 20,
                      color: Theme.of(context).colorScheme.background,
                    ),
                  ),
                ),
                if (!widget.isVertical)
                  const Row(
                    children: [],
                  )
                else
                  Container()
              ],
            ),
          ),
        )
      : Row(
          children: [
            SvgPicture.asset(
              'assets/images/folder.svg',
              width: 25,
              height: 25,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                DateTime.now().toString(),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        );
}

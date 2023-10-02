import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/file_model.dart';
import 'video_player.dart';

class ItemVideoWidget extends StatelessWidget {
  final FileModel file;

  const ItemVideoWidget(this.file, {super.key});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => RayanVideoPlayer(file),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 100,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          height: 100,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            'assets/images/play.svg',
            width: 30,
            height: 30,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
      );
}

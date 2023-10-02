import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';

class ChipWidget extends StatelessWidget {
  final String title;
  final TextStyle? style;

  const ChipWidget({required this.title, super.key, this.style});

  @override
  Widget build(BuildContext context) => DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),
          color: Utils.getBaseTheme(context).chipBackgroundColor.value),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          title,
          style: style ??
              Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.black,
                  ),
        ),
      ));
}

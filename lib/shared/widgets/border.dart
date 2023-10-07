import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/utils.dart';

class BorderWidget extends StatelessWidget {
  final Widget child;
  final Color? color;
  final double? border;

  const BorderWidget({required this.child, super.key, this.color, this.border});

  @override
  Widget build(BuildContext context) => DecoratedBox(
        decoration: BoxDecoration(
          color: color ?? Utils.getBaseTheme(context).chipBackgroundColor,
          borderRadius: BorderRadius.circular(border ?? 8),
        ),
        child: child,
      );
}

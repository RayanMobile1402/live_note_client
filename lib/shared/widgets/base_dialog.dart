import 'package:flutter/material.dart';
import 'package:flutter_nice_ui/flutter_nice_ui.dart';

import '../../core/utils/utils.dart';

class BaseDialog extends StatelessWidget {
  final String title;
  final Widget body;

  const BaseDialog({
    required this.title,
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Dialog(
        insetPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: NiceText(
                    title,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18),
                  ),
                ),
              ),
              Utils.mediumVerticalSpacer,
              body,
            ],
          ),
        ),
      );
}

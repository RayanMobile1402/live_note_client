import 'package:flutter/material.dart';
import 'package:flutter_nice_ui/flutter_nice_ui.dart';

import '../../core/utils/utils.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({
    required this.title,
    required this.value,
    required this.onChanged,
    super.key,
    this.width = 24.0,
    this.height = 24.0,
    this.color,
    this.iconSize = 15,
    this.circleShape = false,
    this.checkColor,
    this.style,
  });

  final double width;
  final double height;
  final Color? color;
  final String title;
  final bool circleShape;
  final bool value;
  final TextStyle? style;

  final double iconSize;
  final Color? checkColor;
  final void Function(bool) onChanged;

  @override
  State<CustomCheckbox> createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.value;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    isChecked = widget.value;
  }

  @override
  void didUpdateWidget(final CustomCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    isChecked = widget.value;
  }

  @override
  Widget build(final BuildContext context) => InkWell(
        onTap: () {
          setState(() => isChecked = !isChecked);
          widget.onChanged.call(isChecked);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 20,
              height:20,
              child: Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: widget.value,
                onChanged: (final value) => widget.onChanged(value!),
                activeColor: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: NiceText(
                widget.title,
                style: widget.style ?? const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      );
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/status_type.dart';

class StatusWidgetListener<T> extends StatefulWidget {
  final ValueListenable<StatusType<T>> initialState;
  final void Function(StatusType<T> state) onStateChanged;
  final ValueWidgetBuilder builder;

  const StatusWidgetListener({
    required this.initialState,
    required this.builder,
    required this.onStateChanged,
    super.key,
  });

  @override
  State<StatusWidgetListener<T>> createState() =>
      _StatusWidgetListenerState<T>();
}

class _StatusWidgetListenerState<T> extends State<StatusWidgetListener<T>> {
  @override
  void initState() {
    widget.initialState.addListener(() {
      widget.onStateChanged.call(widget.initialState.value);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<StatusType<T>>(
      valueListenable: widget.initialState, builder: widget.builder);
}

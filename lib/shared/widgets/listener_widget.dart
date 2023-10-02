import 'package:flutter/material.dart';

import '../models/status_type.dart';

class ListenerWidget<T> extends StatelessWidget {
  final ValueNotifier<StatusType<T>> initialState;
  final void Function(StatusType<T> state) onStateChanged;
  final Widget child;

  const ListenerWidget({
    required this.initialState,
    required this.child,
    required this.onStateChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<StatusType<T>>(
        valueListenable: initialState,
        builder: (final context, final value, final _) {
          onStateChanged.call(value);
          return child;
        },
      );
}

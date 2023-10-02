import 'package:flutter/material.dart';

import '../models/status_type.dart';

class StatusWidget<T> extends StatelessWidget {
  final ValueNotifier<StatusType<T>> initialState;
  final void Function(StatusType<T> state) onStateChanged;
  final Widget Function(StatusType<T>) onSuccess;
  final Widget Function()? onRetry;
  final Widget Function()? onLoading;
  final Widget Function()? onNone;

  const StatusWidget({
    required this.initialState,
    required this.onSuccess,
    required this.onStateChanged,
    this.onRetry,
    this.onNone,
    this.onLoading,
    super.key,
  });

  @override
  Widget build(BuildContext context) => ValueListenableBuilder<StatusType<T>>(
        valueListenable: initialState,
        builder: (final context, final value, final _) => value.when(
          loading: onLoading ?? CircularProgressIndicator.new,
          success: (v) => onSuccess(value),
          error: (c) => onRetry?.call() ?? const Text('retry'),
          none: onNone ?? () => const SizedBox.shrink(),
        ),
      );
}

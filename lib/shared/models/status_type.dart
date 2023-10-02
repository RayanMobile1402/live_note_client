import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/handlers/error_handler/error_handler_view_model.dart';

part 'status_type.freezed.dart';

@Freezed()
sealed class StatusType<T> with _$StatusType<T> {
  factory StatusType.loading() = Loading;

  factory StatusType.success(final T response) = Success;

  factory StatusType.error(final ErrorHandlerViewModel message) = Error;

  factory StatusType.none()=None;
}

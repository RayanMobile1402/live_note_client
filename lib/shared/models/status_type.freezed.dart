// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$StatusType<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T response) success,
    required TResult Function(ErrorHandlerViewModel message) error,
    required TResult Function() none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T response)? success,
    TResult? Function(ErrorHandlerViewModel message)? error,
    TResult? Function()? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T response)? success,
    TResult Function(ErrorHandlerViewModel message)? error,
    TResult Function()? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(None<T> value) none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(None<T> value)? none,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(None<T> value)? none,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusTypeCopyWith<T, $Res> {
  factory $StatusTypeCopyWith(
          StatusType<T> value, $Res Function(StatusType<T>) then) =
      _$StatusTypeCopyWithImpl<T, $Res, StatusType<T>>;
}

/// @nodoc
class _$StatusTypeCopyWithImpl<T, $Res, $Val extends StatusType<T>>
    implements $StatusTypeCopyWith<T, $Res> {
  _$StatusTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadingCopyWith<T, $Res> {
  factory _$$LoadingCopyWith(
          _$Loading<T> value, $Res Function(_$Loading<T>) then) =
      __$$LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$LoadingCopyWithImpl<T, $Res>
    extends _$StatusTypeCopyWithImpl<T, $Res, _$Loading<T>>
    implements _$$LoadingCopyWith<T, $Res> {
  __$$LoadingCopyWithImpl(
      _$Loading<T> _value, $Res Function(_$Loading<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Loading<T> implements Loading<T> {
  _$Loading();

  @override
  String toString() {
    return 'StatusType<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T response) success,
    required TResult Function(ErrorHandlerViewModel message) error,
    required TResult Function() none,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T response)? success,
    TResult? Function(ErrorHandlerViewModel message)? error,
    TResult? Function()? none,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T response)? success,
    TResult Function(ErrorHandlerViewModel message)? error,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(None<T> value) none,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(None<T> value)? none,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(None<T> value)? none,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements StatusType<T> {
  factory Loading() = _$Loading<T>;
}

/// @nodoc
abstract class _$$SuccessCopyWith<T, $Res> {
  factory _$$SuccessCopyWith(
          _$Success<T> value, $Res Function(_$Success<T>) then) =
      __$$SuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T response});
}

/// @nodoc
class __$$SuccessCopyWithImpl<T, $Res>
    extends _$StatusTypeCopyWithImpl<T, $Res, _$Success<T>>
    implements _$$SuccessCopyWith<T, $Res> {
  __$$SuccessCopyWithImpl(
      _$Success<T> _value, $Res Function(_$Success<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
  }) {
    return _then(_$Success<T>(
      freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$Success<T> implements Success<T> {
  _$Success(this.response);

  @override
  final T response;

  @override
  String toString() {
    return 'StatusType<$T>.success(response: $response)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Success<T> &&
            const DeepCollectionEquality().equals(other.response, response));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(response));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      __$$SuccessCopyWithImpl<T, _$Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T response) success,
    required TResult Function(ErrorHandlerViewModel message) error,
    required TResult Function() none,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T response)? success,
    TResult? Function(ErrorHandlerViewModel message)? error,
    TResult? Function()? none,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T response)? success,
    TResult Function(ErrorHandlerViewModel message)? error,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(None<T> value) none,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(None<T> value)? none,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(None<T> value)? none,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements StatusType<T> {
  factory Success(final T response) = _$Success<T>;

  T get response;
  @JsonKey(ignore: true)
  _$$SuccessCopyWith<T, _$Success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorCopyWith<T, $Res> {
  factory _$$ErrorCopyWith(_$Error<T> value, $Res Function(_$Error<T>) then) =
      __$$ErrorCopyWithImpl<T, $Res>;
  @useResult
  $Res call({ErrorHandlerViewModel message});
}

/// @nodoc
class __$$ErrorCopyWithImpl<T, $Res>
    extends _$StatusTypeCopyWithImpl<T, $Res, _$Error<T>>
    implements _$$ErrorCopyWith<T, $Res> {
  __$$ErrorCopyWithImpl(_$Error<T> _value, $Res Function(_$Error<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$Error<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as ErrorHandlerViewModel,
    ));
  }
}

/// @nodoc

class _$Error<T> implements Error<T> {
  _$Error(this.message);

  @override
  final ErrorHandlerViewModel message;

  @override
  String toString() {
    return 'StatusType<$T>.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Error<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorCopyWith<T, _$Error<T>> get copyWith =>
      __$$ErrorCopyWithImpl<T, _$Error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T response) success,
    required TResult Function(ErrorHandlerViewModel message) error,
    required TResult Function() none,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T response)? success,
    TResult? Function(ErrorHandlerViewModel message)? error,
    TResult? Function()? none,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T response)? success,
    TResult Function(ErrorHandlerViewModel message)? error,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(None<T> value) none,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(None<T> value)? none,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(None<T> value)? none,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class Error<T> implements StatusType<T> {
  factory Error(final ErrorHandlerViewModel message) = _$Error<T>;

  ErrorHandlerViewModel get message;
  @JsonKey(ignore: true)
  _$$ErrorCopyWith<T, _$Error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoneCopyWith<T, $Res> {
  factory _$$NoneCopyWith(_$None<T> value, $Res Function(_$None<T>) then) =
      __$$NoneCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$NoneCopyWithImpl<T, $Res>
    extends _$StatusTypeCopyWithImpl<T, $Res, _$None<T>>
    implements _$$NoneCopyWith<T, $Res> {
  __$$NoneCopyWithImpl(_$None<T> _value, $Res Function(_$None<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$None<T> implements None<T> {
  _$None();

  @override
  String toString() {
    return 'StatusType<$T>.none()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$None<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(T response) success,
    required TResult Function(ErrorHandlerViewModel message) error,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(T response)? success,
    TResult? Function(ErrorHandlerViewModel message)? error,
    TResult? Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(T response)? success,
    TResult Function(ErrorHandlerViewModel message)? error,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Loading<T> value) loading,
    required TResult Function(Success<T> value) success,
    required TResult Function(Error<T> value) error,
    required TResult Function(None<T> value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Loading<T> value)? loading,
    TResult? Function(Success<T> value)? success,
    TResult? Function(Error<T> value)? error,
    TResult? Function(None<T> value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Loading<T> value)? loading,
    TResult Function(Success<T> value)? success,
    TResult Function(Error<T> value)? error,
    TResult Function(None<T> value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class None<T> implements StatusType<T> {
  factory None() = _$None<T>;
}

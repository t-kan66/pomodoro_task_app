// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_redirect_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LaunchState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() launching,
    required TResult Function() completed,
    required TResult Function(Object error, StackTrace stackTrace) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? launching,
    TResult? Function()? completed,
    TResult? Function(Object error, StackTrace stackTrace)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? launching,
    TResult Function()? completed,
    TResult Function(Object error, StackTrace stackTrace)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LaunchingStatus value) launching,
    required TResult Function(CompletedStatus value) completed,
    required TResult Function(FailedStatus value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LaunchingStatus value)? launching,
    TResult? Function(CompletedStatus value)? completed,
    TResult? Function(FailedStatus value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LaunchingStatus value)? launching,
    TResult Function(CompletedStatus value)? completed,
    TResult Function(FailedStatus value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LaunchStateCopyWith<$Res> {
  factory $LaunchStateCopyWith(
          LaunchState value, $Res Function(LaunchState) then) =
      _$LaunchStateCopyWithImpl<$Res, LaunchState>;
}

/// @nodoc
class _$LaunchStateCopyWithImpl<$Res, $Val extends LaunchState>
    implements $LaunchStateCopyWith<$Res> {
  _$LaunchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LaunchingStatusImplCopyWith<$Res> {
  factory _$$LaunchingStatusImplCopyWith(_$LaunchingStatusImpl value,
          $Res Function(_$LaunchingStatusImpl) then) =
      __$$LaunchingStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LaunchingStatusImplCopyWithImpl<$Res>
    extends _$LaunchStateCopyWithImpl<$Res, _$LaunchingStatusImpl>
    implements _$$LaunchingStatusImplCopyWith<$Res> {
  __$$LaunchingStatusImplCopyWithImpl(
      _$LaunchingStatusImpl _value, $Res Function(_$LaunchingStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LaunchingStatusImpl implements LaunchingStatus {
  const _$LaunchingStatusImpl();

  @override
  String toString() {
    return 'LaunchState.launching()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LaunchingStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() launching,
    required TResult Function() completed,
    required TResult Function(Object error, StackTrace stackTrace) failed,
  }) {
    return launching();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? launching,
    TResult? Function()? completed,
    TResult? Function(Object error, StackTrace stackTrace)? failed,
  }) {
    return launching?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? launching,
    TResult Function()? completed,
    TResult Function(Object error, StackTrace stackTrace)? failed,
    required TResult orElse(),
  }) {
    if (launching != null) {
      return launching();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LaunchingStatus value) launching,
    required TResult Function(CompletedStatus value) completed,
    required TResult Function(FailedStatus value) failed,
  }) {
    return launching(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LaunchingStatus value)? launching,
    TResult? Function(CompletedStatus value)? completed,
    TResult? Function(FailedStatus value)? failed,
  }) {
    return launching?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LaunchingStatus value)? launching,
    TResult Function(CompletedStatus value)? completed,
    TResult Function(FailedStatus value)? failed,
    required TResult orElse(),
  }) {
    if (launching != null) {
      return launching(this);
    }
    return orElse();
  }
}

abstract class LaunchingStatus implements LaunchState {
  const factory LaunchingStatus() = _$LaunchingStatusImpl;
}

/// @nodoc
abstract class _$$CompletedStatusImplCopyWith<$Res> {
  factory _$$CompletedStatusImplCopyWith(_$CompletedStatusImpl value,
          $Res Function(_$CompletedStatusImpl) then) =
      __$$CompletedStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CompletedStatusImplCopyWithImpl<$Res>
    extends _$LaunchStateCopyWithImpl<$Res, _$CompletedStatusImpl>
    implements _$$CompletedStatusImplCopyWith<$Res> {
  __$$CompletedStatusImplCopyWithImpl(
      _$CompletedStatusImpl _value, $Res Function(_$CompletedStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CompletedStatusImpl implements CompletedStatus {
  const _$CompletedStatusImpl();

  @override
  String toString() {
    return 'LaunchState.completed()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CompletedStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() launching,
    required TResult Function() completed,
    required TResult Function(Object error, StackTrace stackTrace) failed,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? launching,
    TResult? Function()? completed,
    TResult? Function(Object error, StackTrace stackTrace)? failed,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? launching,
    TResult Function()? completed,
    TResult Function(Object error, StackTrace stackTrace)? failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LaunchingStatus value) launching,
    required TResult Function(CompletedStatus value) completed,
    required TResult Function(FailedStatus value) failed,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LaunchingStatus value)? launching,
    TResult? Function(CompletedStatus value)? completed,
    TResult? Function(FailedStatus value)? failed,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LaunchingStatus value)? launching,
    TResult Function(CompletedStatus value)? completed,
    TResult Function(FailedStatus value)? failed,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class CompletedStatus implements LaunchState {
  const factory CompletedStatus() = _$CompletedStatusImpl;
}

/// @nodoc
abstract class _$$FailedStatusImplCopyWith<$Res> {
  factory _$$FailedStatusImplCopyWith(
          _$FailedStatusImpl value, $Res Function(_$FailedStatusImpl) then) =
      __$$FailedStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object error, StackTrace stackTrace});
}

/// @nodoc
class __$$FailedStatusImplCopyWithImpl<$Res>
    extends _$LaunchStateCopyWithImpl<$Res, _$FailedStatusImpl>
    implements _$$FailedStatusImplCopyWith<$Res> {
  __$$FailedStatusImplCopyWithImpl(
      _$FailedStatusImpl _value, $Res Function(_$FailedStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? stackTrace = null,
  }) {
    return _then(_$FailedStatusImpl(
      null == error ? _value.error : error,
      null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$FailedStatusImpl implements FailedStatus {
  const _$FailedStatusImpl(this.error, this.stackTrace);

  @override
  final Object error;
  @override
  final StackTrace stackTrace;

  @override
  String toString() {
    return 'LaunchState.failed(error: $error, stackTrace: $stackTrace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedStatusImpl &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedStatusImplCopyWith<_$FailedStatusImpl> get copyWith =>
      __$$FailedStatusImplCopyWithImpl<_$FailedStatusImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() launching,
    required TResult Function() completed,
    required TResult Function(Object error, StackTrace stackTrace) failed,
  }) {
    return failed(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? launching,
    TResult? Function()? completed,
    TResult? Function(Object error, StackTrace stackTrace)? failed,
  }) {
    return failed?.call(error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? launching,
    TResult Function()? completed,
    TResult Function(Object error, StackTrace stackTrace)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LaunchingStatus value) launching,
    required TResult Function(CompletedStatus value) completed,
    required TResult Function(FailedStatus value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LaunchingStatus value)? launching,
    TResult? Function(CompletedStatus value)? completed,
    TResult? Function(FailedStatus value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LaunchingStatus value)? launching,
    TResult Function(CompletedStatus value)? completed,
    TResult Function(FailedStatus value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FailedStatus implements LaunchState {
  const factory FailedStatus(final Object error, final StackTrace stackTrace) =
      _$FailedStatusImpl;

  Object get error;
  StackTrace get stackTrace;

  /// Create a copy of LaunchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailedStatusImplCopyWith<_$FailedStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RouteRedirectState {
  LaunchState get launchState => throw _privateConstructorUsedError;
  bool get isSigning => throw _privateConstructorUsedError;
  UpdateInfo? get updateInfo => throw _privateConstructorUsedError;
  AuthState? get authState => throw _privateConstructorUsedError;

  /// Create a copy of RouteRedirectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteRedirectStateCopyWith<RouteRedirectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteRedirectStateCopyWith<$Res> {
  factory $RouteRedirectStateCopyWith(
          RouteRedirectState value, $Res Function(RouteRedirectState) then) =
      _$RouteRedirectStateCopyWithImpl<$Res, RouteRedirectState>;
  @useResult
  $Res call(
      {LaunchState launchState,
      bool isSigning,
      UpdateInfo? updateInfo,
      AuthState? authState});

  $LaunchStateCopyWith<$Res> get launchState;
  $UpdateInfoCopyWith<$Res>? get updateInfo;
  $AuthStateCopyWith<$Res>? get authState;
}

/// @nodoc
class _$RouteRedirectStateCopyWithImpl<$Res, $Val extends RouteRedirectState>
    implements $RouteRedirectStateCopyWith<$Res> {
  _$RouteRedirectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RouteRedirectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? launchState = null,
    Object? isSigning = null,
    Object? updateInfo = freezed,
    Object? authState = freezed,
  }) {
    return _then(_value.copyWith(
      launchState: null == launchState
          ? _value.launchState
          : launchState // ignore: cast_nullable_to_non_nullable
              as LaunchState,
      isSigning: null == isSigning
          ? _value.isSigning
          : isSigning // ignore: cast_nullable_to_non_nullable
              as bool,
      updateInfo: freezed == updateInfo
          ? _value.updateInfo
          : updateInfo // ignore: cast_nullable_to_non_nullable
              as UpdateInfo?,
      authState: freezed == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthState?,
    ) as $Val);
  }

  /// Create a copy of RouteRedirectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LaunchStateCopyWith<$Res> get launchState {
    return $LaunchStateCopyWith<$Res>(_value.launchState, (value) {
      return _then(_value.copyWith(launchState: value) as $Val);
    });
  }

  /// Create a copy of RouteRedirectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UpdateInfoCopyWith<$Res>? get updateInfo {
    if (_value.updateInfo == null) {
      return null;
    }

    return $UpdateInfoCopyWith<$Res>(_value.updateInfo!, (value) {
      return _then(_value.copyWith(updateInfo: value) as $Val);
    });
  }

  /// Create a copy of RouteRedirectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AuthStateCopyWith<$Res>? get authState {
    if (_value.authState == null) {
      return null;
    }

    return $AuthStateCopyWith<$Res>(_value.authState!, (value) {
      return _then(_value.copyWith(authState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RouteRedirectStateImplCopyWith<$Res>
    implements $RouteRedirectStateCopyWith<$Res> {
  factory _$$RouteRedirectStateImplCopyWith(_$RouteRedirectStateImpl value,
          $Res Function(_$RouteRedirectStateImpl) then) =
      __$$RouteRedirectStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LaunchState launchState,
      bool isSigning,
      UpdateInfo? updateInfo,
      AuthState? authState});

  @override
  $LaunchStateCopyWith<$Res> get launchState;
  @override
  $UpdateInfoCopyWith<$Res>? get updateInfo;
  @override
  $AuthStateCopyWith<$Res>? get authState;
}

/// @nodoc
class __$$RouteRedirectStateImplCopyWithImpl<$Res>
    extends _$RouteRedirectStateCopyWithImpl<$Res, _$RouteRedirectStateImpl>
    implements _$$RouteRedirectStateImplCopyWith<$Res> {
  __$$RouteRedirectStateImplCopyWithImpl(_$RouteRedirectStateImpl _value,
      $Res Function(_$RouteRedirectStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of RouteRedirectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? launchState = null,
    Object? isSigning = null,
    Object? updateInfo = freezed,
    Object? authState = freezed,
  }) {
    return _then(_$RouteRedirectStateImpl(
      launchState: null == launchState
          ? _value.launchState
          : launchState // ignore: cast_nullable_to_non_nullable
              as LaunchState,
      isSigning: null == isSigning
          ? _value.isSigning
          : isSigning // ignore: cast_nullable_to_non_nullable
              as bool,
      updateInfo: freezed == updateInfo
          ? _value.updateInfo
          : updateInfo // ignore: cast_nullable_to_non_nullable
              as UpdateInfo?,
      authState: freezed == authState
          ? _value.authState
          : authState // ignore: cast_nullable_to_non_nullable
              as AuthState?,
    ));
  }
}

/// @nodoc

class _$RouteRedirectStateImpl implements _RouteRedirectState {
  const _$RouteRedirectStateImpl(
      {required this.launchState,
      required this.isSigning,
      this.updateInfo,
      this.authState});

  @override
  final LaunchState launchState;
  @override
  final bool isSigning;
  @override
  final UpdateInfo? updateInfo;
  @override
  final AuthState? authState;

  @override
  String toString() {
    return 'RouteRedirectState(launchState: $launchState, isSigning: $isSigning, updateInfo: $updateInfo, authState: $authState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteRedirectStateImpl &&
            (identical(other.launchState, launchState) ||
                other.launchState == launchState) &&
            (identical(other.isSigning, isSigning) ||
                other.isSigning == isSigning) &&
            (identical(other.updateInfo, updateInfo) ||
                other.updateInfo == updateInfo) &&
            (identical(other.authState, authState) ||
                other.authState == authState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, launchState, isSigning, updateInfo, authState);

  /// Create a copy of RouteRedirectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteRedirectStateImplCopyWith<_$RouteRedirectStateImpl> get copyWith =>
      __$$RouteRedirectStateImplCopyWithImpl<_$RouteRedirectStateImpl>(
          this, _$identity);
}

abstract class _RouteRedirectState implements RouteRedirectState {
  const factory _RouteRedirectState(
      {required final LaunchState launchState,
      required final bool isSigning,
      final UpdateInfo? updateInfo,
      final AuthState? authState}) = _$RouteRedirectStateImpl;

  @override
  LaunchState get launchState;
  @override
  bool get isSigning;
  @override
  UpdateInfo? get updateInfo;
  @override
  AuthState? get authState;

  /// Create a copy of RouteRedirectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteRedirectStateImplCopyWith<_$RouteRedirectStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

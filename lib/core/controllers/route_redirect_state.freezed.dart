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
mixin _$RouteRedirectState {
  LaunchState get launchState => throw _privateConstructorUsedError;
  bool get isSigning => throw _privateConstructorUsedError;

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
  $Res call({LaunchState launchState, bool isSigning});
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
    ) as $Val);
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
  $Res call({LaunchState launchState, bool isSigning});
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
    ));
  }
}

/// @nodoc

class _$RouteRedirectStateImpl implements _RouteRedirectState {
  const _$RouteRedirectStateImpl(
      {required this.launchState, required this.isSigning});

  @override
  final LaunchState launchState;
  @override
  final bool isSigning;

  @override
  String toString() {
    return 'RouteRedirectState(launchState: $launchState, isSigning: $isSigning)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteRedirectStateImpl &&
            (identical(other.launchState, launchState) ||
                other.launchState == launchState) &&
            (identical(other.isSigning, isSigning) ||
                other.isSigning == isSigning));
  }

  @override
  int get hashCode => Object.hash(runtimeType, launchState, isSigning);

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
      required final bool isSigning}) = _$RouteRedirectStateImpl;

  @override
  LaunchState get launchState;
  @override
  bool get isSigning;

  /// Create a copy of RouteRedirectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteRedirectStateImplCopyWith<_$RouteRedirectStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

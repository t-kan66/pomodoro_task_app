// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateInfo _$UpdateInfoFromJson(Map<String, dynamic> json) {
  return _UpdateInfo.fromJson(json);
}

/// @nodoc
mixin _$UpdateInfo {
  int get updateType => throw _privateConstructorUsedError;
  String get latestVersion => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get storeUrl => throw _privateConstructorUsedError;

  /// Serializes this UpdateInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateInfoCopyWith<UpdateInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateInfoCopyWith<$Res> {
  factory $UpdateInfoCopyWith(
          UpdateInfo value, $Res Function(UpdateInfo) then) =
      _$UpdateInfoCopyWithImpl<$Res, UpdateInfo>;
  @useResult
  $Res call(
      {int updateType, String latestVersion, String message, String storeUrl});
}

/// @nodoc
class _$UpdateInfoCopyWithImpl<$Res, $Val extends UpdateInfo>
    implements $UpdateInfoCopyWith<$Res> {
  _$UpdateInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateType = null,
    Object? latestVersion = null,
    Object? message = null,
    Object? storeUrl = null,
  }) {
    return _then(_value.copyWith(
      updateType: null == updateType
          ? _value.updateType
          : updateType // ignore: cast_nullable_to_non_nullable
              as int,
      latestVersion: null == latestVersion
          ? _value.latestVersion
          : latestVersion // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      storeUrl: null == storeUrl
          ? _value.storeUrl
          : storeUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateInfoImplCopyWith<$Res>
    implements $UpdateInfoCopyWith<$Res> {
  factory _$$UpdateInfoImplCopyWith(
          _$UpdateInfoImpl value, $Res Function(_$UpdateInfoImpl) then) =
      __$$UpdateInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int updateType, String latestVersion, String message, String storeUrl});
}

/// @nodoc
class __$$UpdateInfoImplCopyWithImpl<$Res>
    extends _$UpdateInfoCopyWithImpl<$Res, _$UpdateInfoImpl>
    implements _$$UpdateInfoImplCopyWith<$Res> {
  __$$UpdateInfoImplCopyWithImpl(
      _$UpdateInfoImpl _value, $Res Function(_$UpdateInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateType = null,
    Object? latestVersion = null,
    Object? message = null,
    Object? storeUrl = null,
  }) {
    return _then(_$UpdateInfoImpl(
      updateType: null == updateType
          ? _value.updateType
          : updateType // ignore: cast_nullable_to_non_nullable
              as int,
      latestVersion: null == latestVersion
          ? _value.latestVersion
          : latestVersion // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      storeUrl: null == storeUrl
          ? _value.storeUrl
          : storeUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateInfoImpl implements _UpdateInfo {
  const _$UpdateInfoImpl(
      {required this.updateType,
      required this.latestVersion,
      required this.message,
      required this.storeUrl});

  factory _$UpdateInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UpdateInfoImplFromJson(json);

  @override
  final int updateType;
  @override
  final String latestVersion;
  @override
  final String message;
  @override
  final String storeUrl;

  @override
  String toString() {
    return 'UpdateInfo(updateType: $updateType, latestVersion: $latestVersion, message: $message, storeUrl: $storeUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateInfoImpl &&
            (identical(other.updateType, updateType) ||
                other.updateType == updateType) &&
            (identical(other.latestVersion, latestVersion) ||
                other.latestVersion == latestVersion) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.storeUrl, storeUrl) ||
                other.storeUrl == storeUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, updateType, latestVersion, message, storeUrl);

  /// Create a copy of UpdateInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateInfoImplCopyWith<_$UpdateInfoImpl> get copyWith =>
      __$$UpdateInfoImplCopyWithImpl<_$UpdateInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateInfoImplToJson(
      this,
    );
  }
}

abstract class _UpdateInfo implements UpdateInfo {
  const factory _UpdateInfo(
      {required final int updateType,
      required final String latestVersion,
      required final String message,
      required final String storeUrl}) = _$UpdateInfoImpl;

  factory _UpdateInfo.fromJson(Map<String, dynamic> json) =
      _$UpdateInfoImpl.fromJson;

  @override
  int get updateType;
  @override
  String get latestVersion;
  @override
  String get message;
  @override
  String get storeUrl;

  /// Create a copy of UpdateInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateInfoImplCopyWith<_$UpdateInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

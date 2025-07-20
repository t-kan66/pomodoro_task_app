// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimerSettingState _$TimerSettingStateFromJson(Map<String, dynamic> json) {
  return _TimerSettingState.fromJson(json);
}

/// @nodoc
mixin _$TimerSettingState {
  Duration get workingDuration => throw _privateConstructorUsedError;
  Duration get breakDuration => throw _privateConstructorUsedError;
  int get phaseCount => throw _privateConstructorUsedError;

  /// Serializes this TimerSettingState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimerSettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimerSettingStateCopyWith<TimerSettingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerSettingStateCopyWith<$Res> {
  factory $TimerSettingStateCopyWith(
          TimerSettingState value, $Res Function(TimerSettingState) then) =
      _$TimerSettingStateCopyWithImpl<$Res, TimerSettingState>;
  @useResult
  $Res call({Duration workingDuration, Duration breakDuration, int phaseCount});
}

/// @nodoc
class _$TimerSettingStateCopyWithImpl<$Res, $Val extends TimerSettingState>
    implements $TimerSettingStateCopyWith<$Res> {
  _$TimerSettingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerSettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workingDuration = null,
    Object? breakDuration = null,
    Object? phaseCount = null,
  }) {
    return _then(_value.copyWith(
      workingDuration: null == workingDuration
          ? _value.workingDuration
          : workingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      breakDuration: null == breakDuration
          ? _value.breakDuration
          : breakDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      phaseCount: null == phaseCount
          ? _value.phaseCount
          : phaseCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerSettingStateImplCopyWith<$Res>
    implements $TimerSettingStateCopyWith<$Res> {
  factory _$$TimerSettingStateImplCopyWith(_$TimerSettingStateImpl value,
          $Res Function(_$TimerSettingStateImpl) then) =
      __$$TimerSettingStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Duration workingDuration, Duration breakDuration, int phaseCount});
}

/// @nodoc
class __$$TimerSettingStateImplCopyWithImpl<$Res>
    extends _$TimerSettingStateCopyWithImpl<$Res, _$TimerSettingStateImpl>
    implements _$$TimerSettingStateImplCopyWith<$Res> {
  __$$TimerSettingStateImplCopyWithImpl(_$TimerSettingStateImpl _value,
      $Res Function(_$TimerSettingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? workingDuration = null,
    Object? breakDuration = null,
    Object? phaseCount = null,
  }) {
    return _then(_$TimerSettingStateImpl(
      workingDuration: null == workingDuration
          ? _value.workingDuration
          : workingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      breakDuration: null == breakDuration
          ? _value.breakDuration
          : breakDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      phaseCount: null == phaseCount
          ? _value.phaseCount
          : phaseCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerSettingStateImpl implements _TimerSettingState {
  const _$TimerSettingStateImpl(
      {this.workingDuration = const Duration(minutes: 25),
      this.breakDuration = const Duration(minutes: 5),
      this.phaseCount = 4});

  factory _$TimerSettingStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerSettingStateImplFromJson(json);

  @override
  @JsonKey()
  final Duration workingDuration;
  @override
  @JsonKey()
  final Duration breakDuration;
  @override
  @JsonKey()
  final int phaseCount;

  @override
  String toString() {
    return 'TimerSettingState(workingDuration: $workingDuration, breakDuration: $breakDuration, phaseCount: $phaseCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingStateImpl &&
            (identical(other.workingDuration, workingDuration) ||
                other.workingDuration == workingDuration) &&
            (identical(other.breakDuration, breakDuration) ||
                other.breakDuration == breakDuration) &&
            (identical(other.phaseCount, phaseCount) ||
                other.phaseCount == phaseCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, workingDuration, breakDuration, phaseCount);

  /// Create a copy of TimerSettingState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerSettingStateImplCopyWith<_$TimerSettingStateImpl> get copyWith =>
      __$$TimerSettingStateImplCopyWithImpl<_$TimerSettingStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerSettingStateImplToJson(
      this,
    );
  }
}

abstract class _TimerSettingState implements TimerSettingState {
  const factory _TimerSettingState(
      {final Duration workingDuration,
      final Duration breakDuration,
      final int phaseCount}) = _$TimerSettingStateImpl;

  factory _TimerSettingState.fromJson(Map<String, dynamic> json) =
      _$TimerSettingStateImpl.fromJson;

  @override
  Duration get workingDuration;
  @override
  Duration get breakDuration;
  @override
  int get phaseCount;

  /// Create a copy of TimerSettingState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerSettingStateImplCopyWith<_$TimerSettingStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TimerState {
  Duration get initialWorkingDuration =>
      throw _privateConstructorUsedError; // 初期時間
  Duration get initialBreakDuration =>
      throw _privateConstructorUsedError; // 初期時間
  Duration get currentWorkingDuration =>
      throw _privateConstructorUsedError; // 残り時間(秒)
  Duration get currentBreakDuration =>
      throw _privateConstructorUsedError; // 残り時間(秒)
  Duration get intervalDuration =>
      throw _privateConstructorUsedError; // インターバル時間
  bool get isRunning => throw _privateConstructorUsedError; // タイマー実行中かどうか
  Timer? get timer => throw _privateConstructorUsedError;
  int get completedPomodoros =>
      throw _privateConstructorUsedError; // 完了したポモドーロの数
  PomodoroStatus get status => throw _privateConstructorUsedError; // ポモドーロの状態
  int get maxPomodoros => throw _privateConstructorUsedError;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
  @useResult
  $Res call(
      {Duration initialWorkingDuration,
      Duration initialBreakDuration,
      Duration currentWorkingDuration,
      Duration currentBreakDuration,
      Duration intervalDuration,
      bool isRunning,
      Timer? timer,
      int completedPomodoros,
      PomodoroStatus status,
      int maxPomodoros});
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialWorkingDuration = null,
    Object? initialBreakDuration = null,
    Object? currentWorkingDuration = null,
    Object? currentBreakDuration = null,
    Object? intervalDuration = null,
    Object? isRunning = null,
    Object? timer = freezed,
    Object? completedPomodoros = null,
    Object? status = null,
    Object? maxPomodoros = null,
  }) {
    return _then(_value.copyWith(
      initialWorkingDuration: null == initialWorkingDuration
          ? _value.initialWorkingDuration
          : initialWorkingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      initialBreakDuration: null == initialBreakDuration
          ? _value.initialBreakDuration
          : initialBreakDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      currentWorkingDuration: null == currentWorkingDuration
          ? _value.currentWorkingDuration
          : currentWorkingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      currentBreakDuration: null == currentBreakDuration
          ? _value.currentBreakDuration
          : currentBreakDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      intervalDuration: null == intervalDuration
          ? _value.intervalDuration
          : intervalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      completedPomodoros: null == completedPomodoros
          ? _value.completedPomodoros
          : completedPomodoros // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PomodoroStatus,
      maxPomodoros: null == maxPomodoros
          ? _value.maxPomodoros
          : maxPomodoros // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerStateImplCopyWith<$Res>
    implements $TimerStateCopyWith<$Res> {
  factory _$$TimerStateImplCopyWith(
          _$TimerStateImpl value, $Res Function(_$TimerStateImpl) then) =
      __$$TimerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Duration initialWorkingDuration,
      Duration initialBreakDuration,
      Duration currentWorkingDuration,
      Duration currentBreakDuration,
      Duration intervalDuration,
      bool isRunning,
      Timer? timer,
      int completedPomodoros,
      PomodoroStatus status,
      int maxPomodoros});
}

/// @nodoc
class __$$TimerStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerStateImpl>
    implements _$$TimerStateImplCopyWith<$Res> {
  __$$TimerStateImplCopyWithImpl(
      _$TimerStateImpl _value, $Res Function(_$TimerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialWorkingDuration = null,
    Object? initialBreakDuration = null,
    Object? currentWorkingDuration = null,
    Object? currentBreakDuration = null,
    Object? intervalDuration = null,
    Object? isRunning = null,
    Object? timer = freezed,
    Object? completedPomodoros = null,
    Object? status = null,
    Object? maxPomodoros = null,
  }) {
    return _then(_$TimerStateImpl(
      initialWorkingDuration: null == initialWorkingDuration
          ? _value.initialWorkingDuration
          : initialWorkingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      initialBreakDuration: null == initialBreakDuration
          ? _value.initialBreakDuration
          : initialBreakDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      currentWorkingDuration: null == currentWorkingDuration
          ? _value.currentWorkingDuration
          : currentWorkingDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      currentBreakDuration: null == currentBreakDuration
          ? _value.currentBreakDuration
          : currentBreakDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      intervalDuration: null == intervalDuration
          ? _value.intervalDuration
          : intervalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
      isRunning: null == isRunning
          ? _value.isRunning
          : isRunning // ignore: cast_nullable_to_non_nullable
              as bool,
      timer: freezed == timer
          ? _value.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as Timer?,
      completedPomodoros: null == completedPomodoros
          ? _value.completedPomodoros
          : completedPomodoros // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PomodoroStatus,
      maxPomodoros: null == maxPomodoros
          ? _value.maxPomodoros
          : maxPomodoros // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TimerStateImpl implements _TimerState {
  const _$TimerStateImpl(
      {this.initialWorkingDuration = const Duration(minutes: 25),
      this.initialBreakDuration = const Duration(minutes: 5),
      this.currentWorkingDuration = const Duration(minutes: 25),
      this.currentBreakDuration = const Duration(minutes: 5),
      this.intervalDuration = const Duration(seconds: 1),
      this.isRunning = false,
      this.timer = null,
      this.completedPomodoros = 0,
      this.status = PomodoroStatus.work,
      this.maxPomodoros = 4});

  @override
  @JsonKey()
  final Duration initialWorkingDuration;
// 初期時間
  @override
  @JsonKey()
  final Duration initialBreakDuration;
// 初期時間
  @override
  @JsonKey()
  final Duration currentWorkingDuration;
// 残り時間(秒)
  @override
  @JsonKey()
  final Duration currentBreakDuration;
// 残り時間(秒)
  @override
  @JsonKey()
  final Duration intervalDuration;
// インターバル時間
  @override
  @JsonKey()
  final bool isRunning;
// タイマー実行中かどうか
  @override
  @JsonKey()
  final Timer? timer;
  @override
  @JsonKey()
  final int completedPomodoros;
// 完了したポモドーロの数
  @override
  @JsonKey()
  final PomodoroStatus status;
// ポモドーロの状態
  @override
  @JsonKey()
  final int maxPomodoros;

  @override
  String toString() {
    return 'TimerState(initialWorkingDuration: $initialWorkingDuration, initialBreakDuration: $initialBreakDuration, currentWorkingDuration: $currentWorkingDuration, currentBreakDuration: $currentBreakDuration, intervalDuration: $intervalDuration, isRunning: $isRunning, timer: $timer, completedPomodoros: $completedPomodoros, status: $status, maxPomodoros: $maxPomodoros)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerStateImpl &&
            (identical(other.initialWorkingDuration, initialWorkingDuration) ||
                other.initialWorkingDuration == initialWorkingDuration) &&
            (identical(other.initialBreakDuration, initialBreakDuration) ||
                other.initialBreakDuration == initialBreakDuration) &&
            (identical(other.currentWorkingDuration, currentWorkingDuration) ||
                other.currentWorkingDuration == currentWorkingDuration) &&
            (identical(other.currentBreakDuration, currentBreakDuration) ||
                other.currentBreakDuration == currentBreakDuration) &&
            (identical(other.intervalDuration, intervalDuration) ||
                other.intervalDuration == intervalDuration) &&
            (identical(other.isRunning, isRunning) ||
                other.isRunning == isRunning) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.completedPomodoros, completedPomodoros) ||
                other.completedPomodoros == completedPomodoros) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.maxPomodoros, maxPomodoros) ||
                other.maxPomodoros == maxPomodoros));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      initialWorkingDuration,
      initialBreakDuration,
      currentWorkingDuration,
      currentBreakDuration,
      intervalDuration,
      isRunning,
      timer,
      completedPomodoros,
      status,
      maxPomodoros);

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      __$$TimerStateImplCopyWithImpl<_$TimerStateImpl>(this, _$identity);
}

abstract class _TimerState implements TimerState {
  const factory _TimerState(
      {final Duration initialWorkingDuration,
      final Duration initialBreakDuration,
      final Duration currentWorkingDuration,
      final Duration currentBreakDuration,
      final Duration intervalDuration,
      final bool isRunning,
      final Timer? timer,
      final int completedPomodoros,
      final PomodoroStatus status,
      final int maxPomodoros}) = _$TimerStateImpl;

  @override
  Duration get initialWorkingDuration; // 初期時間
  @override
  Duration get initialBreakDuration; // 初期時間
  @override
  Duration get currentWorkingDuration; // 残り時間(秒)
  @override
  Duration get currentBreakDuration; // 残り時間(秒)
  @override
  Duration get intervalDuration; // インターバル時間
  @override
  bool get isRunning; // タイマー実行中かどうか
  @override
  Timer? get timer;
  @override
  int get completedPomodoros; // 完了したポモドーロの数
  @override
  PomodoroStatus get status; // ポモドーロの状態
  @override
  int get maxPomodoros;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

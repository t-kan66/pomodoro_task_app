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
  PomodoroStatus get status => throw _privateConstructorUsedError;

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
      PomodoroStatus status});
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
      PomodoroStatus status});
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
      this.status = PomodoroStatus.work});

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

  @override
  String toString() {
    return 'TimerState(initialWorkingDuration: $initialWorkingDuration, initialBreakDuration: $initialBreakDuration, currentWorkingDuration: $currentWorkingDuration, currentBreakDuration: $currentBreakDuration, intervalDuration: $intervalDuration, isRunning: $isRunning, timer: $timer, completedPomodoros: $completedPomodoros, status: $status)';
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
            (identical(other.status, status) || other.status == status));
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
      status);

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
      final PomodoroStatus status}) = _$TimerStateImpl;

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
  PomodoroStatus get status;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

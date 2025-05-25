import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_state.freezed.dart';
part 'timer_state.g.dart';

// ポモドーロの状態を管理する
enum PomodoroStatus {
  work,
  rest,
}

@freezed
class TimerSettingState with _$TimerSettingState {
  const factory TimerSettingState({
    @Default(Duration(minutes: 25)) Duration workingDuration,
    @Default(Duration(minutes: 5)) Duration breakDuration,
    @Default(4) int phaseCount,
  }) = _TimerSettingState;

  factory TimerSettingState.fromJson(Map<String, dynamic> json) =>
      _$TimerSettingStateFromJson(json);
}

@freezed
class TimerState with _$TimerState {
  const factory TimerState({
    @Default(Duration(minutes: 25)) Duration initialWorkingDuration, // 初期時間
    @Default(Duration(minutes: 5)) Duration initialBreakDuration, // 初期時間
    @Default(Duration(minutes: 25)) Duration currentWorkingDuration, // 残り時間(秒)
    @Default(Duration(minutes: 5)) Duration currentBreakDuration, // 残り時間(秒)
    @Default(Duration(seconds: 1)) Duration intervalDuration, // インターバル時間
    @Default(false) bool isRunning, // タイマー実行中かどうか
    @Default(null) Timer? timer,
    @Default(0) int completedPomodoros, // 完了したポモドーロの数
    @Default(PomodoroStatus.work) PomodoroStatus status, // ポモドーロの状態
  }) = _TimerState;
}

extension TimerStateExtension on TimerState {
  Duration get currentDurationTime => status == PomodoroStatus.work
      ? currentWorkingDuration
      : currentBreakDuration;

  Duration get initalDurationTime => status == PomodoroStatus.work
      ? initialWorkingDuration
      : initialBreakDuration;
}

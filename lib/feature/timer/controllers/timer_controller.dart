import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/feature/timer/controllers/timer_state.dart';

final timerControllerProvider =
    NotifierProvider<TimerControllerController, TimerState>(
        TimerControllerController.new);

class TimerControllerController extends Notifier<TimerState> {
  @override
  TimerState build() {
    late final Duration intervalTime;
    // 検証モードの場合は1分間隔で更新する
    if (kDebugMode) {
      intervalTime = const Duration(minutes: 1);
    } else {
      intervalTime = const Duration(seconds: 1);
    }

    return TimerState(intervalDuration: intervalTime);
  }

  void startPomodoro() {
    // 開始時の処理を追加
    if (state.isRunning) return;

    final timer = Timer.periodic(const Duration(seconds: 1), _onUpdateTimer);

    state = state.copyWith(isRunning: true, timer: timer);
  }

  void _onUpdateTimer(Timer timer) {
    final current = state.currentDurationTime - state.intervalDuration;

    final isOver = current.compareTo(Duration.zero) < 0;

    if (isOver) {
      timer.cancel();

      final int completedPomodoros;

      // ポモドーロの各種情報を更新する
      if (state.status == PomodoroStatus.work) {
        completedPomodoros = state.completedPomodoros + 1;
      } else {
        completedPomodoros = state.completedPomodoros;
      }

      state = state.copyWith(
        isRunning: false,
        // 残り時間を初期値に戻す
        currentWorkingDuration: state.initialWorkingDuration,
        currentBreakDuration: state.initialBreakDuration,
        completedPomodoros: completedPomodoros,
        status: state.status == PomodoroStatus.work
            ? PomodoroStatus.rest
            : PomodoroStatus.work,
      );
    } else {
      switch (state.status) {
        case PomodoroStatus.work:
          state = state.copyWith(currentWorkingDuration: current);
          break;
        case PomodoroStatus.rest:
          state = state.copyWith(currentBreakDuration: current);
          break;
      }
    }
  }

  void stopPomodoro() {
    if (!state.isRunning) {
      return;
    }
    // 停止時の処理を追加
    state.timer?.cancel();

    // 停止時の処理を追加
    state = state.copyWith(isRunning: false);
  }

  void reset() {
    state = state.copyWith(isRunning: false);
  }

  void startBreak() {
    // 休憩開始時の処理を追加
    if (state.isRunning) return;

    final timer = Timer.periodic(const Duration(seconds: 1), _onUpdateTimer);

    state = state.copyWith(isRunning: true, timer: timer);
  }

  // updateTimerの関数を起動する
}

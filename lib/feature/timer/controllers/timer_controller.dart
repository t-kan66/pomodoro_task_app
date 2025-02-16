import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pomodoro_app/feature/timer/controllers/timer_state.dart';

final timerControllerProvider =
    NotifierProvider<TimerControllerController, TimerState>(
        TimerControllerController.new);

class TimerControllerController extends Notifier<TimerState> {
  @override
  TimerState build() {
    return const TimerState();
  }

  void startPomodoro() {
    // 開始時の処理を追加
    if (state.isRunning) return;

    final timer = Timer.periodic(const Duration(seconds: 1), _onUpdateTimer);

    state = state.copyWith(isRunning: true, timer: timer);
  }

  void _onUpdateTimer(Timer timer) {
    final current = state.currentWorkingDuration - state.intervalDuration;

    final isOver = current.compareTo(Duration.zero) < 0;

    if (isOver) {
      timer.cancel();

      // ポモドーロの各種情報を更新する
      final completedPomodoros = state.completedPomodoros + 1;

      state = state.copyWith(
        isRunning: false,
        currentWorkingDuration: state.currentWorkingDuration,
      );
    } else {
      state = state.copyWith(currentWorkingDuration: current);
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

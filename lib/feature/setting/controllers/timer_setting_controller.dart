import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/repositories/repositories.dart';
import '../../timer/controllers/controller.dart';

final timerSettingsControllerProvider =
    NotifierProvider<TimerSettingController, TimerSettingState>(
  TimerSettingController.new,
);

class TimerSettingController extends Notifier<TimerSettingState> {
  AsyncValue<SharedPreferenceRepository> get _repository =>
      ref.watch(sharedPreferenceRepositoryProvider);

  @override
  TimerSettingState build() {
    return getSettings();
  }

  // 作業時間を更新
  void updateWorkingDuration(Duration newDuration) {
    state = state.copyWith(workingDuration: newDuration);
  }

  // 休憩時間を更新
  void updateBreakDuration(Duration newDuration) {
    state = state.copyWith(breakDuration: newDuration);
  }

  // フェーズ数を更新
  void updatePhaseCount(int newPhaseCount) {
    state = state.copyWith(phaseCount: newPhaseCount);
  }

  // 設定を保存
  Future<void> saveSettings() async {
    _repository.when(
        data: (rep) {
          rep.setTimerSettings(state);

          // 設定を保存した後、タイマーの状態を更新
          ref.read(timerControllerProvider.notifier).getTimerSettings();
        },
        error: (error, stackTrace) {},
        loading: () => const CircularProgressIndicator());
  }

  // 設定を取得
  TimerSettingState getSettings() {
    return _repository
            .whenData((repository) => repository.getTimerSettings())
            .value ??
        const TimerSettingState();
  }
}

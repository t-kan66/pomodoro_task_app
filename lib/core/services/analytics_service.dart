import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAnalyticsProvider = Provider<FirebaseAnalytics>((ref) {
  return FirebaseAnalytics.instance;
});

final firebaseAnalyticsObserverProvider = Provider<FirebaseAnalyticsObserver>((ref) {
  final analytics = ref.watch(firebaseAnalyticsProvider);
  return FirebaseAnalyticsObserver(analytics: analytics);
});

class AnalyticsService {
  final FirebaseAnalytics _analytics;

  AnalyticsService(this._analytics);

  // Timer events
  Future<void> logTimerStarted({
    required String timerType, // 'work', 'short_break', 'long_break'
    required int duration,
  }) async {
    await _analytics.logEvent(
      name: 'timer_started',
      parameters: {
        'timer_type': timerType,
        'duration_minutes': duration,
      },
    );
  }

  Future<void> logTimerCompleted({
    required String timerType,
    required int duration,
  }) async {
    await _analytics.logEvent(
      name: 'timer_completed',
      parameters: {
        'timer_type': timerType,
        'duration_minutes': duration,
      },
    );
  }

  Future<void> logTimerPaused({
    required String timerType,
    required int remainingTime,
  }) async {
    await _analytics.logEvent(
      name: 'timer_paused',
      parameters: {
        'timer_type': timerType,
        'remaining_seconds': remainingTime,
      },
    );
  }

  Future<void> logTimerStopped({
    required String timerType,
    required int remainingTime,
  }) async {
    await _analytics.logEvent(
      name: 'timer_stopped',
      parameters: {
        'timer_type': timerType,
        'remaining_seconds': remainingTime,
      },
    );
  }

  // Settings events
  Future<void> logSettingsChanged({
    required String settingType,
    required dynamic value,
  }) async {
    await _analytics.logEvent(
      name: 'settings_changed',
      parameters: {
        'setting_type': settingType,
        'value': value.toString(),
      },
    );
  }

  // Navigation events
  Future<void> logScreenView({required String screenName}) async {
    await _analytics.logScreenView(screenName: screenName);
  }

  // App lifecycle events
  Future<void> logAppOpened() async {
    await _analytics.logAppOpen();
  }

  // Sound events
  Future<void> logSoundToggled({required bool enabled}) async {
    await _analytics.logEvent(
      name: 'sound_toggled',
      parameters: {
        'enabled': enabled,
      },
    );
  }

  Future<void> logBgmChanged({required String bgmAsset}) async {
    await _analytics.logEvent(
      name: 'bgm_changed',
      parameters: {
        'bgm_asset': bgmAsset,
      },
    );
  }

  Future<void> logSeChanged({required String seAsset}) async {
    await _analytics.logEvent(
      name: 'se_changed',
      parameters: {
        'se_asset': seAsset,
      },
    );
  }
}

final analyticsServiceProvider = Provider<AnalyticsService>((ref) {
  final analytics = ref.watch(firebaseAnalyticsProvider);
  return AnalyticsService(analytics);
});
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:pomodoro_app/core/services/analytics_service.dart';

// Generate mock classes
@GenerateNiceMocks([MockSpec<FirebaseAnalytics>()])
import 'analytics_service_test.mocks.dart';

void main() {
  group('AnalyticsService', () {
    late AnalyticsService analyticsService;
    late MockFirebaseAnalytics mockFirebaseAnalytics;

    setUp(() {
      mockFirebaseAnalytics = MockFirebaseAnalytics();
      analyticsService = AnalyticsService(mockFirebaseAnalytics);
    });

    test('should log timer started event with correct parameters', () async {
      // Arrange
      const timerType = 'work';
      const duration = 25;

      // Act
      await analyticsService.logTimerStarted(
        timerType: timerType,
        duration: duration,
      );

      // Assert
      verify(mockFirebaseAnalytics.logEvent(
        name: 'timer_started',
        parameters: {
          'timer_type': timerType,
          'duration_minutes': duration,
        },
      )).called(1);
    });

    test('should log timer completed event', () async {
      // Arrange
      const timerType = 'short_break';
      const duration = 5;

      // Act
      await analyticsService.logTimerCompleted(
        timerType: timerType,
        duration: duration,
      );

      // Assert
      verify(mockFirebaseAnalytics.logEvent(
        name: 'timer_completed',
        parameters: {
          'timer_type': timerType,
          'duration_minutes': duration,
        },
      )).called(1);
    });

    test('should log settings changed event', () async {
      // Arrange
      const settingType = 'timer_duration';
      const value = 30;

      // Act
      await analyticsService.logSettingsChanged(
        settingType: settingType,
        value: value,
      );

      // Assert
      verify(mockFirebaseAnalytics.logEvent(
        name: 'settings_changed',
        parameters: {
          'setting_type': settingType,
          'value': value.toString(),
        },
      )).called(1);
    });

    test('should log screen view', () async {
      // Arrange
      const screenName = 'timer_page';

      // Act
      await analyticsService.logScreenView(screenName: screenName);

      // Assert
      verify(mockFirebaseAnalytics.logScreenView(screenName: screenName))
          .called(1);
    });

    test('should log sound toggled event', () async {
      // Arrange
      const enabled = true;

      // Act
      await analyticsService.logSoundToggled(enabled: enabled);

      // Assert
      verify(mockFirebaseAnalytics.logEvent(
        name: 'sound_toggled',
        parameters: {
          'enabled': enabled,
        },
      )).called(1);
    });
  });
}
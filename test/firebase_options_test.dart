import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro_app/firebase_options.dart';

void main() {
  group('Firebase Options', () {
    test('should return dev Firebase options when flavor is dev', () {
      // This test verifies that the DefaultFirebaseOptions class
      // properly handles environment-specific configuration
      
      // Test that we have valid Firebase options for different platforms
      expect(DefaultFirebaseOptions.androidDev.projectId, 'pomodoro-app-dev-ce8b6');
      expect(DefaultFirebaseOptions.iosDev.projectId, 'pomodoro-app-dev-ce8b6');
      expect(DefaultFirebaseOptions.androidDev.apiKey, isNotEmpty);
      expect(DefaultFirebaseOptions.iosDev.apiKey, isNotEmpty);
      expect(DefaultFirebaseOptions.androidDev.appId, isNotEmpty);
      expect(DefaultFirebaseOptions.iosDev.appId, isNotEmpty);
    });

    test('should return prod Firebase options for production', () {
      // Test production Firebase options
      expect(DefaultFirebaseOptions.androidProd.projectId, 'pomodoro-app-f720d');
      expect(DefaultFirebaseOptions.iosProd.projectId, 'pomodoro-app-f720d');
      expect(DefaultFirebaseOptions.androidProd.apiKey, isNotEmpty);
      expect(DefaultFirebaseOptions.iosProd.apiKey, isNotEmpty);
      expect(DefaultFirebaseOptions.androidProd.appId, isNotEmpty);
      expect(DefaultFirebaseOptions.iosProd.appId, isNotEmpty);
    });

    test('should have correct bundle IDs for iOS', () {
      expect(DefaultFirebaseOptions.iosDev.iosBundleId, 'com.tkan66.poromodo.dev');
      expect(DefaultFirebaseOptions.iosProd.iosBundleId, 'com.tkan66.poromodo');
    });

    test('should have different project IDs for dev and prod', () {
      expect(DefaultFirebaseOptions.androidDev.projectId, 
             isNot(equals(DefaultFirebaseOptions.androidProd.projectId)));
      expect(DefaultFirebaseOptions.iosDev.projectId, 
             isNot(equals(DefaultFirebaseOptions.iosProd.projectId)));
    });
  });
}
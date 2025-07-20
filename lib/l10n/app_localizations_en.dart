// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Application Title';

  @override
  String get appText => 'Application Text';

  @override
  String get minutes => 'minutes';

  @override
  String get working_start => 'Start';

  @override
  String get working_stop => 'Stop';

  @override
  String get pomodoro_title => 'Pomodoro Timer';

  @override
  String get start_pomodoro => 'Start Pomodoro';

  @override
  String get working_phase => 'Working';

  @override
  String get resting_phase => 'Resting';

  @override
  String get cycles => 'cycles';

  @override
  String get close_confirm_title => 'Confirmation';

  @override
  String get close_confirm_message => 'Stop the timer and close the screen.';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get pomodoro_completed_title => 'Pomodoro Completed!';

  @override
  String get pomodoro_completed_message => 'Great job!\n Take a good break.';

  @override
  String get close => 'Close';
}

// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get appTitle => 'アプリタイトル';

  @override
  String get appText => 'アプリテキスト';

  @override
  String get minutes => '分';

  @override
  String get working_start => '開始';

  @override
  String get working_stop => '停止';

  @override
  String get pomodoro_title => 'ポモドーロタイマー';

  @override
  String get start_pomodoro => 'ポモドーロを開始';

  @override
  String get working_phase => '作業';

  @override
  String get resting_phase => '休憩';

  @override
  String get cycles => 'サイクル';

  @override
  String get close_confirm_title => '確認';

  @override
  String get close_confirm_message => 'タイマーをストップし、画面を閉じます。';

  @override
  String get yes => 'はい';

  @override
  String get no => 'いいえ';

  @override
  String get pomodoro_completed_title => 'ポモドーロ完了！';

  @override
  String get pomodoro_completed_message => 'お疲れさまでした！\nしっかり休憩しましょう！';

  @override
  String get close => '閉じる';
}

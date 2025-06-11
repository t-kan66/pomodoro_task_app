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
  String get working_start => '開始';

  @override
  String get working_stop => '停止';
}

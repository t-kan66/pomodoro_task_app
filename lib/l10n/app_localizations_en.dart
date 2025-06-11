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
  String get working_start => 'Start';

  @override
  String get working_stop => 'Stop';
}

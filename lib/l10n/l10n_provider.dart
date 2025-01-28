import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// https://codewithandrea.com/articles/app-localizations-outside-widgets-riverpod/
/// provider used to access the AppLocalizations object for the current locale
final l10nProvider = Provider<L10n>((ref) {
  final locale = WidgetsBinding.instance.platformDispatcher.locale;

  ref.state = _safeLookupL10n(locale);

  final observer = _LocaleObserver((locales) {
    ref.state = _safeLookupL10n(locale);
  });

  final binding = WidgetsBinding.instance..addObserver(observer);

  ref.onDispose(() => binding.removeObserver(observer));

  return ref.state;
});

L10n _safeLookupL10n(Locale locale) => L10n.delegate.isSupported(locale)
    ? lookupL10n(locale)
    : lookupL10n(L10n.supportedLocales.first);

/// observer used to notify the caller when the locale changes
class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);
  final void Function(List<Locale>? locales) _didChangeLocales;
  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}

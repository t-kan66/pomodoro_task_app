# Firebase Setup Documentation

このドキュメントでは、Pomodoro Task AppのFirebaseセットアップについて説明します。

## セットアップ概要

Firebase Core と Firebase Analytics が環境ごとに設定されています：

- **開発環境 (dev)**: `pomodoro-app-dev-ce8b6` プロジェクト
- **本番環境 (prod)**: `pomodoro-app-f720d` プロジェクト

## 環境ごとの設定

### 開発環境 (dev)
- プロジェクトID: `pomodoro-app-dev-ce8b6`
- アプリ名: `promodo_app_dev`
- バンドルID: `com.tkan66.poromodo.dev`

### 本番環境 (prod) 
- プロジェクトID: `pomodoro-app-f720d`
- アプリ名: `pomodoro_app`
- バンドルID: `com.tkan66.poromodo`

## ファイル構成

### Core Firebase設定
- `lib/firebase_options.dart` - 環境ごとのFirebase設定
- `lib/main.dart` - Firebase初期化とAnalytics設定

### Analytics サービス
- `lib/core/services/analytics_service.dart` - Firebase Analytics ラッパー

### プラットフォーム設定

#### Android
- `android/app/src/dev/google-services.json` - 開発環境用
- `android/app/src/prod/google-services.json` - 本番環境用

#### iOS
- `ios/dev/GoogleService-Info.plist` - 開発環境用
- `ios/prod/GoogleService-Info.plist` - 本番環境用

## Analytics イベント

以下のイベントが自動的にトラッキングされます：

### タイマーイベント
- `timer_started` - タイマー開始時
- `timer_completed` - タイマー完了時
- `timer_paused` - タイマー一時停止時
- `timer_stopped` - タイマー停止時

### 設定変更イベント
- `settings_changed` - 設定変更時
- `sound_toggled` - サウンド設定変更時
- `bgm_changed` - BGM変更時
- `se_changed` - SE変更時

### ナビゲーションイベント
- 自動的なスクリーンビュートラッキング

## ビルド方法

### 開発環境でビルド
```bash
flutter build apk --dart-define-from-file=dart_defines/dev.env
flutter build ios --dart-define-from-file=dart_defines/dev.env
```

### 本番環境でビルド
```bash
flutter build apk --dart-define-from-file=dart_defines/prod.env
flutter build ios --dart-define-from-file=dart_defines/prod.env
```

## カスタムAnalyticsイベント

新しいAnalyticsイベントを追加するには：

1. `AnalyticsService` クラスに新しいメソッドを追加
2. 該当する画面やコントローラーからメソッドを呼び出す

例：
```dart
// AnalyticsServiceに追加
Future<void> logCustomEvent({required String eventName}) async {
  await _analytics.logEvent(name: eventName);
}

// 使用例
final analytics = ref.read(analyticsServiceProvider);
analytics.logCustomEvent(eventName: 'custom_action');
```

## テスト

Firebase設定のテストは以下で実行できます：

```bash
flutter test test/firebase_options_test.dart
flutter test test/analytics_service_test.dart
```

## トラブルシューティング

### iOSでAnalyticsが動作しない場合
- `GoogleService-Info.plist` で `IS_ANALYTICS_ENABLED` が `true` になっているか確認
- 正しい環境の設定ファイルが使用されているか確認

### Androidでビルドエラーが発生する場合
- `google-services.json` が正しいディレクトリに配置されているか確認
- Gradleビルドが正しいファイルを選択しているか確認

### 環境の切り替えができない場合
- `dart_defines` フォルダ内の環境ファイルが正しく設定されているか確認
- ビルド時に `--dart-define-from-file` オプションが指定されているか確認
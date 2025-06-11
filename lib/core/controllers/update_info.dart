import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_info.freezed.dart';
part 'update_info.g.dart';

@freezed
class UpdateInfo with _$UpdateInfo {
  const factory UpdateInfo({
    required int updateType,
    required String latestVersion,
    required String message,
    required String storeUrl,
  }) = _UpdateInfo;

  factory UpdateInfo.fromJson(Map<String, dynamic> json) => _$UpdateInfoFromJson(json);
}

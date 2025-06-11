// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateInfoImpl _$$UpdateInfoImplFromJson(Map<String, dynamic> json) =>
    _$UpdateInfoImpl(
      updateType: (json['updateType'] as num).toInt(),
      latestVersion: json['latestVersion'] as String,
      message: json['message'] as String,
      storeUrl: json['storeUrl'] as String,
    );

Map<String, dynamic> _$$UpdateInfoImplToJson(_$UpdateInfoImpl instance) =>
    <String, dynamic>{
      'updateType': instance.updateType,
      'latestVersion': instance.latestVersion,
      'message': instance.message,
      'storeUrl': instance.storeUrl,
    };

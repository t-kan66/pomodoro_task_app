// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TimerSettingStateImpl _$$TimerSettingStateImplFromJson(
        Map<String, dynamic> json) =>
    _$TimerSettingStateImpl(
      workingDuration: json['workingDuration'] == null
          ? const Duration(minutes: 25)
          : Duration(microseconds: (json['workingDuration'] as num).toInt()),
      breakDuration: json['breakDuration'] == null
          ? const Duration(minutes: 5)
          : Duration(microseconds: (json['breakDuration'] as num).toInt()),
      phaseCount: (json['phaseCount'] as num?)?.toInt() ?? 4,
    );

Map<String, dynamic> _$$TimerSettingStateImplToJson(
        _$TimerSettingStateImpl instance) =>
    <String, dynamic>{
      'workingDuration': instance.workingDuration.inMicroseconds,
      'breakDuration': instance.breakDuration.inMicroseconds,
      'phaseCount': instance.phaseCount,
    };

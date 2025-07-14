// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthStateImpl _$$AuthStateImplFromJson(Map<String, dynamic> json) =>
    _$AuthStateImpl(
      status: $enumDecode(_$AuthStatusEnumMap, json['status']),
      userId: json['userId'] as String?,
      userEmail: json['userEmail'] as String?,
    );

Map<String, dynamic> _$$AuthStateImplToJson(_$AuthStateImpl instance) =>
    <String, dynamic>{
      'status': _$AuthStatusEnumMap[instance.status]!,
      'userId': instance.userId,
      'userEmail': instance.userEmail,
    };

const _$AuthStatusEnumMap = {
  AuthStatus.unknown: 'unknown',
  AuthStatus.authenticated: 'authenticated',
  AuthStatus.unauthenticated: 'unauthenticated',
};

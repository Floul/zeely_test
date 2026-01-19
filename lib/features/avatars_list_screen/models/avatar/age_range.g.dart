// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'age_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgeRangeImpl _$$AgeRangeImplFromJson(Map<String, dynamic> json) =>
    _$AgeRangeImpl(
      label: json['label'] as String,
      minAge: (json['minAge'] as num).toInt(),
      maxAge: (json['maxAge'] as num).toInt(),
    );

Map<String, dynamic> _$$AgeRangeImplToJson(_$AgeRangeImpl instance) =>
    <String, dynamic>{
      'label': instance.label,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
    };

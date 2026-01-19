// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avatar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvatarImpl _$$AvatarImplFromJson(Map<String, dynamic> json) => _$AvatarImpl(
  id: json['id'] as String,
  name: json['name'] as String,
  gender: $enumDecode(_$GenderEnumMap, json['gender']),
  age: (json['age'] as num).toInt(),
  pose: $enumDecode(_$PoseEnumMap, json['pose']),
  imagePath: json['imagePath'] as String,
);

Map<String, dynamic> _$$AvatarImplToJson(_$AvatarImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': _$GenderEnumMap[instance.gender]!,
      'age': instance.age,
      'pose': _$PoseEnumMap[instance.pose]!,
      'imagePath': instance.imagePath,
    };

const _$GenderEnumMap = {Gender.male: 'male', Gender.female: 'female'};

const _$PoseEnumMap = {
  Pose.standing: 'standing',
  Pose.sitting: 'sitting',
  Pose.selfie: 'selfie',
  Pose.carSelfie: 'carSelfie',
  Pose.walking: 'walking',
};

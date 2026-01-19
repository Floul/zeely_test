import 'package:freezed_annotation/freezed_annotation.dart';

import 'age_range.dart';
import 'gender.dart';
import 'pose.dart';

export 'age_range.dart';
export 'gender.dart';
export 'pose.dart';

part 'avatar_model.freezed.dart';
part 'avatar_model.g.dart';

/// Model class representing an avatar.
@freezed
class Avatar with _$Avatar {
  const Avatar._();

  const factory Avatar({
    required String id,
    required String name,
    required Gender gender,
    required int age,
    required Pose pose,
    required String imagePath,
  }) = _Avatar;

  factory Avatar.fromJson(Map<String, dynamic> json) => _$AvatarFromJson(json);

  /// Get the age range this avatar belongs to.
  AgeRange? get ageRange {
    for (final range in AgeRange.allRanges) {
      if (range.contains(age)) {
        return range;
      }
    }
    return null;
  }

  /// Check if the avatar matches a given age range.
  bool isInAgeRange(AgeRange range) {
    return range.contains(age);
  }
}

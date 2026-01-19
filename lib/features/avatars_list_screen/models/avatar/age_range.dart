import 'package:freezed_annotation/freezed_annotation.dart';

part 'age_range.freezed.dart';
part 'age_range.g.dart';

/// Class representing an age range for filtering avatars.
@freezed
class AgeRange with _$AgeRange {
  const AgeRange._();

  const factory AgeRange({
    required String label,
    required int minAge,
    required int maxAge,
  }) = _AgeRange;

  factory AgeRange.fromJson(Map<String, dynamic> json) =>
      _$AgeRangeFromJson(json);

  /// Predefined age ranges for filtering.
  static const AgeRange youngAdults = AgeRange(
    label: '18-24',
    minAge: 18,
    maxAge: 24,
  );

  static const AgeRange adults = AgeRange(
    label: '25-39',
    minAge: 25,
    maxAge: 39,
  );

  static const AgeRange middleAged = AgeRange(
    label: '40-64',
    minAge: 40,
    maxAge: 64,
  );

  static const AgeRange olderAdults = AgeRange(
    label: '65+',
    minAge: 65,
    maxAge: 150,
  );

  /// Human-readable display name for the age range.
  String get displayName {
    if (this == youngAdults) return 'Young adults';
    if (this == adults) return 'Adults';
    if (this == middleAged) return 'Middle-aged adults';
    if (this == olderAdults) return 'Older adults';
    return label;
  }

  /// List of all available age ranges.
  static const List<AgeRange> allRanges = [
    youngAdults,
    adults,
    middleAged,
    olderAdults,
  ];

  /// Check if a given age falls within this range.
  bool contains(int age) {
    return age >= minAge && age <= maxAge;
  }
}

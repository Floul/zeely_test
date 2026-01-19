import 'package:zeely_test/features/avatars_list_screen/models/avatar/avatar_model.dart';

import 'avatar_service.dart';

/// Mock implementation of [AvatarService] for development and testing.
///
/// Provides a set of 20 diverse mock avatars with varied attributes
/// covering all filter categories (gender, age ranges, poses).
class MockAvatarService implements AvatarService {
  /// List of mock avatars with diverse attributes.
  ///
  /// Covers all combinations of:
  /// - Gender: Male, Female
  /// - Age ranges: 18-24, 25-39, 40-64, 65+
  /// - Poses: Standing, Sitting, Selfie, CarSelfie, Walking
  static final List<Avatar> _mockAvatars = [
    // Young Adults (18-24)
    const Avatar(
      id: '1',
      name: 'Emma',
      gender: Gender.female,
      age: 22,
      pose: Pose.selfie,
      imagePath: 'assets/images/avatars/avatar_1.jpg',
    ),
    const Avatar(
      id: '2',
      name: 'Liam',
      gender: Gender.male,
      age: 19,
      pose: Pose.standing,
      imagePath: 'assets/images/avatars/avatar_2.jpg',
    ),
    const Avatar(
      id: '3',
      name: 'Sophia',
      gender: Gender.female,
      age: 24,
      pose: Pose.walking,
      imagePath: 'assets/images/avatars/avatar_3.jpg',
    ),
    const Avatar(
      id: '4',
      name: 'Noah',
      gender: Gender.male,
      age: 21,
      pose: Pose.carSelfie,
      imagePath: 'assets/images/avatars/avatar_4.jpg',
    ),
    const Avatar(
      id: '5',
      name: 'Olivia',
      gender: Gender.female,
      age: 18,
      pose: Pose.sitting,
      imagePath: 'assets/images/avatars/avatar_5.jpg',
    ),

    // Adults (25-39)
    const Avatar(
      id: '6',
      name: 'James',
      gender: Gender.male,
      age: 28,
      pose: Pose.standing,
      imagePath: 'assets/images/avatars/avatar_6.jpg',
    ),
    const Avatar(
      id: '7',
      name: 'Ava',
      gender: Gender.female,
      age: 32,
      pose: Pose.selfie,
      imagePath: 'assets/images/avatars/avatar_7.jpg',
    ),
    const Avatar(
      id: '8',
      name: 'William',
      gender: Gender.male,
      age: 35,
      pose: Pose.sitting,
      imagePath: 'assets/images/avatars/avatar_8.jpg',
    ),
    const Avatar(
      id: '9',
      name: 'Isabella',
      gender: Gender.female,
      age: 27,
      pose: Pose.walking,
      imagePath: 'assets/images/avatars/avatar_9.jpg',
    ),
    const Avatar(
      id: '10',
      name: 'Benjamin',
      gender: Gender.male,
      age: 39,
      pose: Pose.carSelfie,
      imagePath: 'assets/images/avatars/avatar_10.jpg',
    ),

    // Middle-aged (40-64)
    const Avatar(
      id: '11',
      name: 'Charlotte',
      gender: Gender.female,
      age: 45,
      pose: Pose.standing,
      imagePath: 'assets/images/avatars/avatar_11.jpg',
    ),
    const Avatar(
      id: '12',
      name: 'Michael',
      gender: Gender.male,
      age: 52,
      pose: Pose.selfie,
      imagePath: 'assets/images/avatars/avatar_12.jpg',
    ),
    const Avatar(
      id: '13',
      name: 'Mia',
      gender: Gender.female,
      age: 48,
      pose: Pose.carSelfie,
      imagePath: 'assets/images/avatars/avatar_13.jpg',
    ),
    const Avatar(
      id: '14',
      name: 'Daniel',
      gender: Gender.male,
      age: 58,
      pose: Pose.walking,
      imagePath: 'assets/images/avatars/avatar_14.jpg',
    ),
    const Avatar(
      id: '15',
      name: 'Harper',
      gender: Gender.female,
      age: 41,
      pose: Pose.sitting,
      imagePath: 'assets/images/avatars/avatar_15.jpg',
    ),

    // Older Adults (65+)
    const Avatar(
      id: '16',
      name: 'Robert',
      gender: Gender.male,
      age: 68,
      pose: Pose.standing,
      imagePath: 'assets/images/avatars/avatar_16.jpg',
    ),
    const Avatar(
      id: '17',
      name: 'Evelyn',
      gender: Gender.female,
      age: 72,
      pose: Pose.sitting,
      imagePath: 'assets/images/avatars/avatar_17.jpg',
    ),
    const Avatar(
      id: '18',
      name: 'Charles',
      gender: Gender.male,
      age: 75,
      pose: Pose.walking,
      imagePath: 'assets/images/avatars/avatar_18.jpg',
    ),
    const Avatar(
      id: '19',
      name: 'Grace',
      gender: Gender.female,
      age: 66,
      pose: Pose.selfie,
      imagePath: 'assets/images/avatars/avatar_19.jpg',
    ),
    const Avatar(
      id: '20',
      name: 'David',
      gender: Gender.male,
      age: 80,
      pose: Pose.carSelfie,
      imagePath: 'assets/images/avatars/avatar_20.jpg',
    ),
  ];

  @override
  Future<List<Avatar>> getAllAvatars() async {
    // Simulate network delay for realistic behavior
    await Future.delayed(const Duration(milliseconds: 300));
    return List.unmodifiable(_mockAvatars);
  }
}

import 'package:zeely_test/services/avatar_service/avatar_service.dart';

import '../models/avatar/avatar_model.dart';
import '../models/avatar/gender.dart';
import '../models/avatar/pose.dart';

class MockAvatarService implements AvatarService {
  static const String _avatarBasePath = 'assets/images/avatars';

  static final List<Avatar> _mockAvatars = [
    const Avatar(
      id: '1',
      name: 'Marcus',
      gender: Gender.male,
      age: 28,
      pose: Pose.standing,
      imagePath: '$_avatarBasePath/1.png',
    ),
    const Avatar(
      id: '2',
      name: 'Tyler',
      gender: Gender.male,
      age: 25,
      pose: Pose.standing,
      imagePath: '$_avatarBasePath/2.png',
    ),
    const Avatar(
      id: '3',
      name: 'Kofi',
      gender: Gender.male,
      age: 23,
      pose: Pose.standing,
      imagePath: '$_avatarBasePath/3.png',
    ),
    const Avatar(
      id: '4',
      name: 'Aisha',
      gender: Gender.female,
      age: 24,
      pose: Pose.selfie,
      imagePath: '$_avatarBasePath/4.png',
    ),
    const Avatar(
      id: '5',
      name: 'Emily',
      gender: Gender.female,
      age: 30,
      pose: Pose.standing,
      imagePath: '$_avatarBasePath/5.png',
    ),
    const Avatar(
      id: '6',
      name: 'Sophie',
      gender: Gender.female,
      age: 27,
      pose: Pose.standing,
      imagePath: '$_avatarBasePath/6.png',
    ),
    const Avatar(
      id: '7',
      name: 'Maya',
      gender: Gender.female,
      age: 22,
      pose: Pose.standing,
      imagePath: '$_avatarBasePath/7.png',
    ),
  ];

  @override
  Future<List<Avatar>> getAllAvatars() async {
    // Simulate network delay for realistic behavior
    await Future.delayed(const Duration(milliseconds: 300));
    return List.unmodifiable(_mockAvatars);
  }
}

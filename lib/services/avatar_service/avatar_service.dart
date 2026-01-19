import 'package:zeely_test/features/avatars_list_screen/models/avatar/avatar_model.dart';

/// Abstract interface for avatar data operations.
///
/// This interface defines the contract for retrieving avatar data.
/// Implementations can include mock data, API calls, or local database access.
abstract class AvatarService {
  /// Retrieves all available avatars.
  ///
  /// Returns a [Future] containing a list of all [Avatar] objects.
  Future<List<Avatar>> getAllAvatars();
}

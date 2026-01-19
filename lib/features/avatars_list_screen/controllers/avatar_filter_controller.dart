import 'package:get/get.dart';

import '../../../services/avatar_service/avatar_service.dart';
import '../models/avatar/avatar_model.dart';
import '../models/avatar/filter_type.dart';

class AvatarFilterController extends GetxController {
  /// The avatar service used to fetch avatar data.
  final AvatarService _avatarService = Get.find<AvatarService>();

  /// All avatars loaded from the service.
  final RxList<Avatar> allAvatars = <Avatar>[].obs;

  /// Avatars after applying all active filters.
  final RxList<Avatar> filteredAvatars = <Avatar>[].obs;

  /// Currently selected gender filters.
  final RxList<Gender> selectedGenders = <Gender>[].obs;

  /// Currently selected age range filters.
  final RxList<AgeRange> selectedAgeRanges = <AgeRange>[].obs;

  /// Currently selected pose filters.
  final RxList<Pose> selectedPoses = <Pose>[].obs;

  /// Loading state indicator.
  final RxBool isLoading = false.obs;

  /// Error message if loading fails.
  final RxnString errorMessage = RxnString();

  @override
  void onInit() {
    super.onInit();
    initializeAvatars();
  }

  /// Loads all avatars from the service and initializes the filtered list.
  ///
  /// Sets [isLoading] to true during the operation.
  /// On success, populates [allAvatars] and [filteredAvatars].
  /// On failure, sets [errorMessage] with the error details.
  Future<void> initializeAvatars() async {
    isLoading.value = true;
    errorMessage.value = null;

    try {
      final avatars = await _avatarService.getAllAvatars();
      allAvatars.assignAll(avatars);
      _filterAvatars();
    } catch (e) {
      errorMessage.value = 'Failed to load avatars: $e';
    } finally {
      isLoading.value = false;
    }
  }

  /// Applies the given gender filter selections.
  ///
  /// Replaces the current gender selections with [genders] and re-filters.
  void applyGenderFilter(List<Gender> genders) {
    selectedGenders.value = genders;
    _filterAvatars();
  }

  /// Applies the given age range filter selections.
  ///
  /// Replaces the current age range selections with [ageRanges] and re-filters.
  void applyAgeFilter(List<AgeRange> ageRanges) {
    selectedAgeRanges.value = ageRanges;
    _filterAvatars();
  }

  /// Applies the given pose filter selections.
  ///
  /// Replaces the current pose selections with [poses] and re-filters.
  void applyPoseFilter(List<Pose> poses) {
    selectedPoses.value = poses;
    _filterAvatars();
  }

  /// Clears the specified filter type.
  ///
  /// Removes all selections for [filterType] and re-filters the list.
  void clearFilter(FilterType filterType) {
    switch (filterType) {
      case FilterType.gender:
        selectedGenders.value = [];
      case FilterType.age:
        selectedAgeRanges.value = [];
      case FilterType.pose:
        selectedPoses.value = [];
    }
    _filterAvatars();
  }

  /// Clears all active filters.
  ///
  /// Resets all filter selections and shows all avatars.
  void clearAllFilters() {
    selectedGenders.value = [];
    selectedAgeRanges.value = [];
    selectedPoses.value = [];
    _filterAvatars();
  }

  /// Applies all active filters to the avatar list.
  ///
  /// Filter logic:
  /// - Filters are combined with AND logic (avatar must match ALL active filters)
  /// - Within each filter category, selections use OR logic (e.g., Male OR Female)
  /// - Empty filter means "match all" for that category
  void _filterAvatars() {
    if (!(selectedGenders.isNotEmpty || selectedAgeRanges.isNotEmpty || selectedPoses.isNotEmpty)) {
      // No filters active - show all avatars
      filteredAvatars.assignAll(allAvatars);
      return;
    }

    final filtered =
        allAvatars.where((avatar) {
          // Gender filter: avatar must match any selected gender (OR logic)
          if (selectedGenders.isNotEmpty && !selectedGenders.contains(avatar.gender)) {
            return false;
          }

          // Age filter: avatar's age must fall within any selected range (OR logic)
          if (selectedAgeRanges.isNotEmpty) {
            final matchesAge = selectedAgeRanges.any((range) => avatar.isInAgeRange(range));
            if (!matchesAge) {
              return false;
            }
          }

          // Pose filter: avatar must match any selected pose (OR logic)
          if (selectedPoses.isNotEmpty && !selectedPoses.contains(avatar.pose)) {
            return false;
          }

          return true;
        }).toList();

    filteredAvatars.assignAll(filtered);
  }
}

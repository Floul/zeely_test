import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/avatar_filter_controller.dart';
import '../models/avatar/avatar_model.dart';
import '../widgets/avatar_card.dart';
import '../widgets/empty_state_widget.dart';
import '../widgets/filter_bar.dart';
import '../widgets/filter_bottom_sheet.dart';

class AvatarListScreen extends StatelessWidget {
  const AvatarListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton(icon: const Icon(Icons.chevron_left), onPressed: () => Get.back()),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Row(children: [Text('All avatars', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold))]),
            const SizedBox(height: 12),
            FilterBar(
              onGenderTap: () => _showGenderFilter(context),
              onAgeTap: () => _showAgeFilter(context),
              onPoseTap: () => _showPoseFilter(context),
            ),
            const SizedBox(height: 24),
            const Expanded(child: _AvatarListContent()),
          ],
        ),
      ),
    );
  }

  void _showGenderFilter(BuildContext context) {
    final controller = Get.find<AvatarFilterController>();
    showFilterBottomSheet<Gender>(
      context: context,
      title: 'Gender',
      options: Gender.values,
      selectedOptions: controller.selectedGenders.toList(),
      labelBuilder: (gender) => gender.displayName,
      onSave: (selected) => controller.applyGenderFilter(selected),
    );
  }

  void _showAgeFilter(BuildContext context) {
    final controller = Get.find<AvatarFilterController>();
    showFilterBottomSheet<AgeRange>(
      context: context,
      title: 'Age',
      options: AgeRange.allRanges,
      selectedOptions: controller.selectedAgeRanges.toList(),
      labelBuilder: (ageRange) => ageRange.displayName,
      subTextBuilder: (ageRange) => ageRange.label,
      onSave: (selected) => controller.applyAgeFilter(selected),
    );
  }

  void _showPoseFilter(BuildContext context) {
    final controller = Get.find<AvatarFilterController>();
    showFilterBottomSheet<Pose>(
      context: context,
      title: 'Pose',
      options: Pose.values,
      selectedOptions: controller.selectedPoses.toList(),
      labelBuilder: (pose) => pose.displayName,
      onSave: (selected) => controller.applyPoseFilter(selected),
    );
  }
}

class _AvatarListContent extends StatelessWidget {
  const _AvatarListContent();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AvatarFilterController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return const _LoadingIndicator();
      }

      if (controller.errorMessage.value != null) {
        return _ErrorMessage(message: controller.errorMessage.value!);
      }

      if (controller.filteredAvatars.isEmpty) {
        return EmptyStateWidget(onClearFilters: controller.clearAllFilters);
      }

      return _AvatarGrid(avatars: controller.filteredAvatars);
    });
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 64, color: theme.colorScheme.error),
            const SizedBox(height: 16),
            Text(
              message,
              style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.error),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _AvatarGrid extends StatelessWidget {
  const _AvatarGrid({required this.avatars});

  final List<Avatar> avatars;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 112 / 152,
      ),
      itemCount: avatars.length,
      itemBuilder: (context, index) {
        final avatar = avatars[index];
        return AvatarCard(avatar: avatar);
      },
    );
  }
}

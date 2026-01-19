import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/avatar_filter_controller.dart';
import '../models/avatar/filter_type.dart';

class FilterBar extends StatelessWidget {
  const FilterBar({super.key, this.onGenderTap, this.onAgeTap, this.onPoseTap});

  final VoidCallback? onGenderTap;
  final VoidCallback? onAgeTap;
  final VoidCallback? onPoseTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const _ClearAllFiltersButton(),
        _GenderFilterButton(
          onTap: onGenderTap,
          onClear: () => Get.find<AvatarFilterController>().clearFilter(FilterType.gender),
        ),
        const SizedBox(width: 8),
        _AgeFilterButton(
          onTap: onAgeTap,
          onClear: () => Get.find<AvatarFilterController>().clearFilter(FilterType.age),
        ),
        const SizedBox(width: 8),
        _PoseFilterButton(
          onTap: onPoseTap,
          onClear: () => Get.find<AvatarFilterController>().clearFilter(FilterType.pose),
        ),
      ],
    );
  }
}

class _ClearAllFiltersButton extends StatelessWidget {
  const _ClearAllFiltersButton();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AvatarFilterController>();

    return Obx(() {
      final hasActiveFilters = controller.selectedGenders.isNotEmpty ||
          controller.selectedAgeRanges.isNotEmpty ||
          controller.selectedPoses.isNotEmpty;

      if (!hasActiveFilters) return const SizedBox.shrink();

      return Padding(
        padding: const EdgeInsets.only(right: 8),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          child: InkWell(
            onTap: controller.clearAllFilters,
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFF2F4F6), width: 1),
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.close, size: 18, color: Colors.black),
            ),
          ),
        ),
      );
    });
  }
}

class _GenderFilterButton extends StatelessWidget {
  const _GenderFilterButton({this.onTap, this.onClear});

  final VoidCallback? onTap;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AvatarFilterController>();

    return Obx(() {
      final count = controller.selectedGenders.length;
      final isActive = count > 0;
      return FilterButton(label: 'Gender', isActive: isActive, count: count, onTap: onTap, onClear: onClear);
    });
  }
}

class _AgeFilterButton extends StatelessWidget {
  const _AgeFilterButton({this.onTap, this.onClear});

  final VoidCallback? onTap;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AvatarFilterController>();

    return Obx(() {
      final count = controller.selectedAgeRanges.length;
      final isActive = count > 0;
      return FilterButton(label: 'Age', isActive: isActive, count: count, onTap: onTap, onClear: onClear);
    });
  }
}

class _PoseFilterButton extends StatelessWidget {
  const _PoseFilterButton({this.onTap, this.onClear});

  final VoidCallback? onTap;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AvatarFilterController>();

    return Obx(() {
      final count = controller.selectedPoses.length;
      final isActive = count > 0;
      return FilterButton(label: 'Pose', isActive: isActive, count: count, onTap: onTap, onClear: onClear);
    });
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.label,
    required this.isActive,
    required this.count,
    this.onTap,
    this.onClear,
  });

  final String label;
  final bool isActive;
  final int count;
  final VoidCallback? onTap;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          height: 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFF2F4F6), width: 1),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _FilterButtonLabel(label: label, count: count),
              const SizedBox(width: 12),
              _FilterButtonTrailingIcon(isActive: isActive, onClear: onClear),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilterButtonLabel extends StatelessWidget {
  const _FilterButtonLabel({required this.label, required this.count});

  final String label;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 12)),
        if (count > 0) ...[const SizedBox(width: 4), _CountBadge(count: count)],
      ],
    );
  }
}

class _CountBadge extends StatelessWidget {
  const _CountBadge({required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: const BoxDecoration(color: Colors.black, shape: BoxShape.circle),
      alignment: Alignment.center,
      child: Text('$count', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w600)),
    );
  }
}

class _FilterButtonTrailingIcon extends StatelessWidget {
  const _FilterButtonTrailingIcon({required this.isActive, this.onClear});

  final bool isActive;
  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    if (isActive) {
      return GestureDetector(
        onTap: onClear,
        behavior: HitTestBehavior.opaque,
        child: const Icon(Icons.close, size: 18, color: Colors.black),
      );
    }

    return const Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.black);
  }
}

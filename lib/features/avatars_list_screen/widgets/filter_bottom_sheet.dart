import 'package:flutter/material.dart';

class FilterBottomSheet<T> extends StatefulWidget {
  const FilterBottomSheet({
    super.key,
    required this.title,
    required this.options,
    required this.selectedOptions,
    required this.labelBuilder,
    this.subTextBuilder,
    required this.onSave,
  });

  final String title;
  final List<T> options;
  final List<T> selectedOptions;
  final String Function(T option) labelBuilder;
  final String Function(T option)? subTextBuilder;
  final void Function(List<T> selected) onSave;

  @override
  State<FilterBottomSheet<T>> createState() => _FilterBottomSheetState<T>();
}

class _FilterBottomSheetState<T> extends State<FilterBottomSheet<T>> {
  late List<T> _selectedOptions;

  @override
  void initState() {
    super.initState();
    _selectedOptions = List<T>.from(widget.selectedOptions);
  }

  void _toggleOption(T option) {
    setState(() {
      if (_selectedOptions.contains(option)) {
        _selectedOptions.remove(option);
      } else {
        _selectedOptions.add(option);
      }
    });
  }

  void _handleSave() {
    widget.onSave(_selectedOptions);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(28))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilterBottomSheetHeader(title: widget.title, onClose: () => Navigator.of(context).pop()),
            const SizedBox(height: 24),
            FilterOptionsList<T>(
              options: widget.options,
              selectedOptions: _selectedOptions,
              labelBuilder: widget.labelBuilder,
              subTextBuilder: widget.subTextBuilder,
              onToggle: _toggleOption,
            ),
            const SizedBox(height: 32),
            FilterSaveButton(onSave: _handleSave),
          ],
        ),
      ),
    );
  }
}

class FilterBottomSheetHeader extends StatelessWidget {
  const FilterBottomSheetHeader({super.key, required this.title, required this.onClose});

  final String title;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        const Spacer(),
        GestureDetector(onTap: onClose, child: const Icon(Icons.close, size: 24)),
      ],
    );
  }
}

class FilterOptionsList<T> extends StatelessWidget {
  const FilterOptionsList({
    super.key,
    required this.options,
    required this.selectedOptions,
    required this.labelBuilder,
    this.subTextBuilder,
    required this.onToggle,
  });

  final List<T> options;
  final List<T> selectedOptions;
  final String Function(T option) labelBuilder;
  final String Function(T option)? subTextBuilder;
  final void Function(T option) onToggle;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        final isSelected = selectedOptions.contains(option);

        return FilterOptionItem(
          label: labelBuilder(option),
          subText: subTextBuilder?.call(option),
          isSelected: isSelected,
          onTap: () => onToggle(option),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 24);
      },
    );
  }
}

class FilterOptionItem extends StatelessWidget {
  const FilterOptionItem({super.key, required this.label, this.subText, required this.isSelected, required this.onTap});

  final String label;
  final String? subText;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 14)),
                if (subText != null)
                  Text(
                    subText!,
                    style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 14),
                  ),
              ],
            ),
          ),
          FilterCheckbox(isSelected: isSelected),
        ],
      ),
    );
  }
}

class FilterCheckbox extends StatelessWidget {
  const FilterCheckbox({super.key, required this.isSelected});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        color: isSelected ? Colors.black : Colors.transparent,
        border: Border.all(color: isSelected ? Colors.black : const Color(0xFFCAD4DD), width: 1),
      ),
      child: isSelected ? Icon(Icons.check, size: 16, color: colorScheme.onPrimary) : null,
    );
  }
}

class FilterSaveButton extends StatelessWidget {
  const FilterSaveButton({super.key, required this.onSave});

  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FilledButton(
        onPressed: onSave,
        style: FilledButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: const StadiumBorder(),
          backgroundColor: Colors.black,
        ),
        child: const Text('Save', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

void showFilterBottomSheet<T>({
  required BuildContext context,
  required String title,
  required List<T> options,
  required List<T> selectedOptions,
  required String Function(T option) labelBuilder,
  String Function(T option)? subTextBuilder,
  required void Function(List<T> selected) onSave,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder:
        (context) => FilterBottomSheet<T>(
          title: title,
          options: options,
          selectedOptions: selectedOptions,
          labelBuilder: labelBuilder,
          subTextBuilder: subTextBuilder,
          onSave: onSave,
        ),
  );
}

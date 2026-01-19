import 'package:flutter/material.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key, this.onClearFilters});

  final VoidCallback? onClearFilters;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _EmptyStateIcon(),
            const _EmptyStateMessage(),
            const SizedBox(height: 24),
            _ClearFiltersButton(onPressed: onClearFilters),
          ],
        ),
      ),
    );
  }
}

class _EmptyStateIcon extends StatelessWidget {
  const _EmptyStateIcon();

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/empty_list_image.png', width: 165, height: 165);
  }
}

class _EmptyStateMessage extends StatelessWidget {
  const _EmptyStateMessage();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Nothing was found using these filters',
      style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),
      textAlign: TextAlign.center,
    );
  }
}

class _ClearFiltersButton extends StatelessWidget {
  const _ClearFiltersButton({this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 153,
      height: 62,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: Colors.black,
          side: const BorderSide(color: Color(0xFFF2F4F6), width: 1),
          shape: const StadiumBorder(),
        ),
        child: const Text('Clear filters'),
      ),
    );
  }
}

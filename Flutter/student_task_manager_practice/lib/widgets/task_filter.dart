import 'package:flutter/material.dart';

class TaskFilter extends StatelessWidget {
  final String selectedFilter;
  final ValueChanged<String> onFilterChanged;

  const TaskFilter({
    super.key,
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    const filters = ['All', 'Pending', 'Completed'];

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      children: filters.map((filter) {
        return ChoiceChip(
          label: Text(filter),
          selected: selectedFilter == filter,
          onSelected: (selected) {
            if (selected) {
              onFilterChanged(filter);
            }
          },
        );
      }).toList(),
    );
  }
}
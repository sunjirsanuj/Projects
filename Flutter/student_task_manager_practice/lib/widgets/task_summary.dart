import 'package:flutter/material.dart';

class TaskSummary extends StatelessWidget {
  final int total;
  final int completed;
  final int pending;

  const TaskSummary({
    super.key,
    required this.total,
    required this.completed,
    required this.pending,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildCard(
          title: 'Total',
          count: total,
          icon: Icons.list_alt,
          color: Colors.indigo,
        ),
        const SizedBox(width: 8),
        _buildCard(
          title: 'Pending',
          count: pending,
          icon: Icons.pending_actions,
          color: Colors.orange,
        ),
        const SizedBox(width: 8),
        _buildCard(
          title: 'Completed',
          count: completed,
          icon: Icons.check_circle_outline,
          color: Colors.green,
        ),
      ],
    );
  }

  Widget _buildCard({
    required String title,
    required int count,
    required IconData icon,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
          vertical: 16,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: color.withValues(alpha: 0.25),
          ),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              '$count',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
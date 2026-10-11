import 'package:flutter/material.dart';

import '../data/dummy_tasks.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = List.from(dummyTasks);

  String _filter = 'All';

  List<Task> get tasks {
    switch (_filter) {
      case 'Pending':
        return _tasks.where((task) => !task.isCompleted).toList();

      case 'Completed':
        return _tasks.where((task) => task.isCompleted).toList();

      default:
        return List.unmodifiable(_tasks);
    }
  }

  int get totalTasks => _tasks.length;

  int get completedTasks =>
      _tasks.where((task) => task.isCompleted).length;

  int get pendingTasks => totalTasks - completedTasks;

  String get filter => _filter;

  void addTask({
    required String title,
    required String description,
    required String category,
  }) {
    if (title.trim().isEmpty) return;

    final int newId = _tasks.isEmpty
        ? 1
        : _tasks
                  .map((task) => task.id)
                  .reduce((a, b) => a > b ? a : b) +
              1;

    _tasks.add(
      Task(
        id: newId,
        title: title.trim(),
        description: description.trim(),
        category: category,
      ),
    );

    notifyListeners();
  }

  void toggleTask(Task task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  void deleteTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void changeFilter(String filter) {
    if (!['All', 'Pending', 'Completed'].contains(filter)) return;

    _filter = filter;
    notifyListeners();
  }

  void clearCompletedTasks() {
    _tasks.removeWhere((task) => task.isCompleted);
    notifyListeners();
  }
}
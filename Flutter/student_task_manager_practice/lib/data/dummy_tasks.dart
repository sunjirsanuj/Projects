import '../models/task.dart';

final List<Task> dummyTasks = [
  Task(
    id: 1,
    title: 'Complete Flutter UI',
    description: 'Finish the home screen design',
    category: 'Programming',
  ),
  Task(
    id: 2,
    title: 'Study Data Structures',
    description: 'Revise trees and graph algorithms',
    category: 'Study',
    isCompleted: true,
  ),
  Task(
    id: 3,
    title: 'Practice Codeforces',
    description: 'Solve two programming problems',
    category: 'Practice',
  ),
  Task(
    id: 4,
    title: 'Learn Provider',
    description: 'Understand ChangeNotifier and Consumer',
    category: 'Programming',
  ),
  Task(
    id: 5,
    title: 'Prepare Assignment',
    description: 'Complete the database assignment',
    category: 'Study',
  ),
];
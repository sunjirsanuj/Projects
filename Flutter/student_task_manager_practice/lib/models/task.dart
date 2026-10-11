class Task {
  final int id;
  final String title;
  final String description;
  final String category;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    this.isCompleted = false,
  });
}
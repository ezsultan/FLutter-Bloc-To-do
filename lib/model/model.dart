import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String id;
  final String task;
  final String description;
  final bool? isCompleted;
  final bool? isCancel;

  const Todo({
    required this.id,
    required this.task,
    required this.description,
    this.isCompleted,
    this.isCancel,
  });

  Todo copyWith({
    String? id,
    String? task,
    String? description,
    bool? isCompleted,
    bool? isCancel,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      isCancel: isCancel ?? this.isCancel,
    );
  }

  @override
  List<Object?> get props => [
        id,
        task,
        description,
        isCompleted,
        isCancel,
      ];

  static List<Todo> todos = const [
    Todo(
      id: '1',
      task: 'Sample task',
      description: 'this is sample to do',
    ),
    Todo(
      id: '2',
      task: 'Sample task 2',
      description: 'this is sample to do 2',
    )
  ];
}

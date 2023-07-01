// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoModel {
  final int userId; // user_id
  final int id;
  final String title;
  final bool completed;
  TodoModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  // TodoModel({
  //   required this.userId,
  //   required this.id,
  //   required this.title,
  //   required this.completed,
  // });

  // Map<String, dynamic> toMap() {
  //   return {
  //     'userId': userId,
  //     'id': id,
  //     'title': title,
  //     'completed': completed,
  //   };
  // }

  // factory TodoModel.fromMap(Map<String, dynamic> map) {
  //   return TodoModel(
  //     userId: map['userId'],
  //     id: map['id'],
  //     title: map['title'],
  //     completed: map['completed'],
  //   );
  // }

  TodoModel copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return TodoModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      completed: map['completed'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TodoModel(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(covariant TodoModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;
  }
}

class Task {
  int? id;
  String? title;
  String? description;

  Task({this.id, this.title, this.description});

  // Método para convertir JSON a un objeto Task
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

  // Método para convertir un objeto Task a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }
}

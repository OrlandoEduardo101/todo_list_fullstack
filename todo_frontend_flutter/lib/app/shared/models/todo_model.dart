class TodoModel {
  TodoModel({this.name, this.id, this.done});

  final String name;
  final int id;
  final bool done;

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
        done: json['done'],
        name: json['name'],
        id: json['id']
        );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'done': done
  };
}

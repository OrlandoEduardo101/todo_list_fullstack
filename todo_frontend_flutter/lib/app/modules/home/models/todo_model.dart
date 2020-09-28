class TodoModel {
  int id;
  String name = '';
  bool done = false;
  User user;

  TodoModel({this.id, this.name, this.done, this.user});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    done = json['done'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['done'] = this.done;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int id;

  User({this.id});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

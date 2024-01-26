class LogResponse {
  LogResponse({
    required this.description,
    required this.id,
    required this.task,
    required this.title,
    required this.type,
    required this.user,
  });
  late final String description;
  late final int id;
  late final Task task;
  late final String title;
  late final String type;
  late final User user;
  
  LogResponse.fromJson(Map<String, dynamic> json){
    description = json['description'];
    id = json['id'];
    task = Task.fromJson(json['task']);
    title = json['title'];
    type = json['type'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['description'] = description;
    _data['id'] = id;
    _data['task'] = task.toJson();
    _data['title'] = title;
    _data['type'] = type;
    _data['user'] = user.toJson();
    return _data;
  }
}

class Task {
  Task({
    required this.category,
    required this.description,
    required this.id,
    required this.labels,
    required this.prioridad,
    required this.status,
    required this.title,
    required this.user,
  });
  late final int category;
  late final String description;
  late final int id;
  late final List<String> labels;
  late final int prioridad;
  late final bool status;
  late final String title;
  late final User user;
  
  Task.fromJson(Map<String, dynamic> json){
    category = json['category'];
    description = json['description'];
    id = json['id'];
    labels = List.castFrom<dynamic, String>(json['labels']);
    prioridad = json['prioridad'];
    status = json['status'];
    title = json['title'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['category'] = category;
    _data['description'] = description;
    _data['id'] = id;
    _data['labels'] = labels;
    _data['prioridad'] = prioridad;
    _data['status'] = status;
    _data['title'] = title;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.names,
    required this.roles,
    required this.surnames,
    required this.username,
  });
  late final int id;
  late final String names;
  late final List<Roles> roles;
  late final String surnames;
  late final String username;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    names = json['names'];
    roles = List.from(json['roles']).map((e)=>Roles.fromJson(e)).toList();
    surnames = json['surnames'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['names'] = names;
    _data['roles'] = roles.map((e)=>e.toJson()).toList();
    _data['surnames'] = surnames;
    _data['username'] = username;
    return _data;
  }
}

class Roles {
  Roles({
    required this.id,
    required this.name,
  });
  late final int id;
  late final String name;
  
  Roles.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    return _data;
  }
}
class TaskResponse {
  TaskResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.labels,
    required this.prioridad,
    required this.status,
    required this.user,
  });
  late final int id;
  late final String title;
  late final String description;
  late final int category;
  late final List<String> labels;
  late final int prioridad;
  late final bool status;
  late final User user;
  
  TaskResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    labels = List.castFrom<dynamic, String>(json['labels']);
    prioridad = json['prioridad'];
    status = json['status'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['description'] = description;
    _data['category'] = category;
    _data['labels'] = labels;
    _data['prioridad'] = prioridad;
    _data['status'] = status;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.names,
    required this.surnames,
    required this.username,
    required this.roles,
  });
  late final int id;
  late final String names;
  late final String surnames;
  late final String username;
  late final List<dynamic> roles;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    names = json['names'];
    surnames = json['surnames'];
    username = json['username'];
    roles = List.castFrom<dynamic, dynamic>(json['roles']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['names'] = names;
    _data['surnames'] = surnames;
    _data['username'] = username;
    _data['roles'] = roles;
    return _data;
  }
}
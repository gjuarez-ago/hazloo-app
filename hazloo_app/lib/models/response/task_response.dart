class TaskResponse {
  TaskResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.prioridad,
    required this.status,
    required this.user,
  });
  late final int id;
  late final String title;
  late final String description;
  late final int category;
  late final int prioridad;
  late final bool status;
  late final User user;
  
  TaskResponse.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
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
    _data['prioridad'] = prioridad;
    _data['status'] = status;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.names,
    required this.username,
    required this.gender,
    required this.role,
    required this.joinDate,
    required this.authorities,
    required this.lastLoginDate,
    required this.lastLoginDateDisplay,
    required this.active,
    required this.notLocked,
  });
  late final String names;
  late final String username;
  late final bool gender;
  late final String role;
  late final int joinDate;
  late final List<String> authorities;
  late final int lastLoginDate;
  late final int lastLoginDateDisplay;
  late final bool active;
  late final bool notLocked;
  
  User.fromJson(Map<String, dynamic> json){
    names = json['names'];
    username = json['username'];
    gender = json['gender'];
    role = json['role'];
    joinDate = json['joinDate'];
    authorities = List.castFrom<dynamic, String>(json['authorities']);
    lastLoginDate = json['lastLoginDate'];
    lastLoginDateDisplay = json['lastLoginDateDisplay'];
    active = json['active'];
    notLocked = json['notLocked'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['names'] = names;
    _data['username'] = username;
    _data['gender'] = gender;
    _data['role'] = role;
    _data['joinDate'] = joinDate;
    _data['authorities'] = authorities;
    _data['lastLoginDate'] = lastLoginDate;
    _data['lastLoginDateDisplay'] = lastLoginDateDisplay;
    _data['active'] = active;
    _data['notLocked'] = notLocked;
    return _data;
  }
}
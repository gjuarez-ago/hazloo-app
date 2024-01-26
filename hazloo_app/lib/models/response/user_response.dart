class UserResponse {
  UserResponse({
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
  
  UserResponse.fromJson(Map<String, dynamic> json){
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
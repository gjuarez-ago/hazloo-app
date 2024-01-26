class LoginResponse {
  LoginResponse({
    required this.user,
    required this.token,
  });
  late final User user;
  late final String token;
  
  LoginResponse.fromJson(Map<String, dynamic> json){
    user = User.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['token'] = token;
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
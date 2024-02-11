class UserResponse {
  UserResponse({
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
  
  UserResponse.fromJson(Map<String, dynamic> json){
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
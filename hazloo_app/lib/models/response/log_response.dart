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
  late final int task;
  late final String title;
  late final String type;
  late final int user;
  
  LogResponse.fromJson(Map<String, dynamic> json){
    description = json['description'];
    id = json['id'];
    task = json['task'];
    title = json['title'];
    type = json['type'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['description'] = description;
    _data['id'] = id;
    _data['task'] = task;
    _data['title'] = title;
    _data['type'] = type;
    _data['user'] = user;
    return _data;
  }
}

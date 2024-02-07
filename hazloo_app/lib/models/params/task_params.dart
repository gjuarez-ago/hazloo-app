class TaskParams {
  TaskParams({
    required this.title,
    required this.description,
    required this.category,
    required this.prioridad,
    required this.user,
  });

  late final String title;
  late final String description;
  late final String category;
  late final String prioridad;
  late final int user;
  
  TaskParams.fromJson(Map<String, dynamic> json){
    title = json['title'];
    description = json['description'];
    category = json['category'];
    prioridad = json['prioridad'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    _data['description'] = description;
    _data['category'] = category;
    _data['prioridad'] = prioridad;
    _data['user'] = user;
    return _data;
  }
}

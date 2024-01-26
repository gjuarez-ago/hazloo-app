class TaskParams {
  TaskParams({
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
  late final int user;
  
  TaskParams.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    labels = List.castFrom<dynamic, String>(json['labels']);
    prioridad = json['prioridad'];
    status = json['status'];
    user = status = json['user'];
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
    _data['user'] = user;
    return _data;
  }
}

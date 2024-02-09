class NotificationResponse {
  NotificationResponse({
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
  
  NotificationResponse.fromJson(Map<String, dynamic> json){
    description = json['description'];
    id = json['id'];
    task = json['task'];
    title = json['title'];
    type = json['type'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['description'] = description;
    data['id'] = id;
    data['task'] = task;
    data['title'] = title;
    data['type'] = type;
    data['user'] = user;
    return data;
  }
}
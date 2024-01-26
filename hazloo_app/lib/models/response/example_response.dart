class ResponseExample {
  int? id;
  String? name;
  int? userId;

  ResponseExample({this.id, this.name, this.userId});

  ResponseExample.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['userId'] = this.userId;
    return data;
  }
}

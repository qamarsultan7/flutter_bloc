class PostModel {
  int? postId;
  int? it;
  String? name;
  String? email;
  String? body;

  PostModel({this.postId, this.it, this.name, this.email, this.body});

  PostModel.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    it = json['it'];
    name = json['name'];
    email = json['email'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = postId;
    data['it'] = it;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }
}

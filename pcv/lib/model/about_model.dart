class AboutModel {
  String? msg;
  Data? data;
  int? codeState;

  AboutModel({this.msg, this.data, this.codeState});

  AboutModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = (json['data'] as Map).isEmpty ? null : Data.fromJson(json['data']);
    codeState = json['codeState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataMap = <String, dynamic>{};
    dataMap['msg'] = msg;
    if (data != null) {
      dataMap['data'] = data?.toJson();
    }
    dataMap['codeState'] = codeState;
    return dataMap;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  String ? titlePosition;
  String? phone;
  String? location;
  String? birthday;
  String? about;
  String? image;
  String? createAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.titlePosition,
        this.phone,
        this.location,
        this.birthday,
        this.about,
        this.image,
        this.createAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    titlePosition = json['title_position'];
    phone = json['phone'];
    location = json['location'];
    birthday = json['birthday'];
    about = json['about'];
    image = json['image'];
    createAt = json['create_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['title_position'] = titlePosition;
    data['phone'] = phone;
    data['location'] = location;
    data['birthday'] = birthday;
    data['about'] = about;
    data['image'] = image;
    data['create_at'] = createAt;
    return data;
  }
}

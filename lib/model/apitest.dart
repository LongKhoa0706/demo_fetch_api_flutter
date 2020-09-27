import 'package:json_annotation/json_annotation.dart';

part 'apitest.g.dart';

@JsonSerializable()
class Apitest {
  String id;
  String firstName;
  String lastName;
  String gender;
  String dob;
  String email;
  String phone;
  String website;
  String address;
  String status;
  Links lLinks;

  Apitest(
      {this.id,
      this.firstName,
      this.lastName,
      this.gender,
      this.dob,
      this.email,
      this.phone,
      this.website,
      this.address,
      this.status,
      this.lLinks});

  factory Apitest.fromJson(Map<String, dynamic> json) =>
      _$ApitestFromJson(json);

  Map<String, dynamic> toJson() => _$ApitestToJson(this);
}

class Links {
  Self self;
  Self edit;
  Self avatar;

  Links({this.self, this.edit, this.avatar});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
    edit = json['edit'] != null ? new Self.fromJson(json['edit']) : null;
    avatar = json['avatar'] != null ? new Self.fromJson(json['avatar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.toJson();
    }
    if (this.edit != null) {
      data['edit'] = this.edit.toJson();
    }
    if (this.avatar != null) {
      data['avatar'] = this.avatar.toJson();
    }
    return data;
  }
}

class Self {
  String href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

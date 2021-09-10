import 'dart:convert';

class LoginModel {
  bool? status;
  String? message;
  UserData? data;

  LoginModel.fromMap(Map<String, dynamic> map) {
    status = map['status'];
    message = map['message'];
    data = map['data'] != null ? UserData.fromMap(map["data"]) : null;
  }
}

class UserData {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? points;
  int? credit;
  String? token;

  UserData({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.image,
    this.points,
    this.credit,
    this.token,
  });

  

  /// named constructor
  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      image: map['image'],
      points: map['points'],
      credit: map['credit'],
      token: map['token'],
    );
  }

}

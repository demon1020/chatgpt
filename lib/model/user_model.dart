class UserModel {
  bool? status;
  String? message;
  Data? data;

  UserModel({this.status, this.message, this.data});

  UserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? sId;
  String? userId;
  String? email;
  String? password;
  String? firstName;
  String? photoUrl;
  String? remainingToken;
  String? usedToken;
  String? freeToken;
  String? isActive;
  String? lastActive;

  Data(
      {this.sId,
        this.userId,
        this.email,
        this.password,
        this.firstName,
        this.photoUrl,
        this.remainingToken,
        this.usedToken,
        this.freeToken,
        this.isActive,
        this.lastActive});

  Data.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    email = json['email'];
    password = json['password'];
    firstName = json['firstName'];
    photoUrl = json['photoUrl'];
    remainingToken = json['remainingToken'];
    usedToken = json['usedToken'];
    freeToken = json['freeToken'];
    isActive = json['isActive'];
    lastActive = json['lastActive'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['userId'] = this.userId;
    data['email'] = this.email;
    data['password'] = this.password;
    data['firstName'] = this.firstName;
    data['photoUrl'] = this.photoUrl;
    data['remainingToken'] = this.remainingToken;
    data['usedToken'] = this.usedToken;
    data['freeToken'] = this.freeToken;
    data['isActive'] = this.isActive;
    data['lastActive'] = this.lastActive;
    return data;
  }
}


import 'dart:convert';

LoginResponse loginResponseFromModel(String str) =>LoginResponse.fromJson(json.decode(str));

class LoginResponse {
  List<Items>? items;
  String? status;
  String? message;
  int? totalCount;

  LoginResponse({this.items, this.status, this.message, this.totalCount});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
   return LoginResponse(
      items: List<Items>.from(json["items"].map((e)=> Items.fromJson(e))),
      status: json['status'],
      message: json['message'],
      totalCount: json['totalCount']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items'] = List<dynamic>.from(items!.map((e)=>e.toJson()));
    data['status'] = status;
    data['message'] = message;
    data['totalCount'] = totalCount;
    return data;
  }
}

class Items {
  String? mobile;
  String? password;

  Items({this.mobile, this.password});

  Items.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'] ?? '';
    password = json['password'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = mobile;
    data['password'] = password;
    return data;
  }
}

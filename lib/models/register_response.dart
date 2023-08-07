import 'dart:convert';

RegisterResponse registerResponseFromModel(String str) =>RegisterResponse.fromJson(json.decode(str));

class RegisterResponse {
  int? code;
  String? message;
  Document? document;
  String? statusID;
  String? statusMessage;
  int? totalCount;

  RegisterResponse(
      {this.code,
        this.message,
        this.document,
        this.statusID,
        this.statusMessage,
        this.totalCount});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
        code : json['code'],
        message : json['message'],
        document : json['document'] != null
        ? Document.fromJson(json['document'])
            : null,
        statusID : json['statusID'],
        statusMessage : json['statusMessage'],
        totalCount : json['totalCount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = code;
    data['message'] = message;
    if (document != null) {
      data['document'] = document!.toJson();
    }
    data['statusID'] = statusID;
    data['statusMessage'] = statusMessage;
    data['totalCount'] = totalCount;
    return data;
  }
}

class Document {
  int? statusID;
  String? statusMessage;

  Document({this.statusID, this.statusMessage});

  Document.fromJson(Map<String, dynamic> json) {
    statusID = json['statusID'];
    statusMessage = json['statusMessage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusID'] = statusID;
    data['statusMessage'] = statusMessage;
    return data;
  }
}
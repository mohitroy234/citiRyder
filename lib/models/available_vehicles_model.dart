import 'dart:convert';
AvailableVehicles availableVehiclesResponse(String str)=>AvailableVehicles.fromJson(jsonDecode(str));
class AvailableVehicles {
  List<Items>? items;
  String? status;
  String? message;
  int? totalCount;

  AvailableVehicles({this.items, this.status, this.message, this.totalCount});

  factory AvailableVehicles.fromJson(Map<String, dynamic> json) {
    return AvailableVehicles(
    // if (json['items'] != null) {
    //   items = <Items>[];
    //   json['items'].forEach((v) {
    //     items!.add(new Items.fromJson(v));
    //   });
    // }
      items:List<Items>.from(json['items'].map((e)=> Items.fromJson(e))),
      status : json['status'],
      message : json['message'],
      totalCount : json['totalCount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    data['message'] = message;
    data['totalCount'] = totalCount;
    return data;
  }
}

class Items {
  String? routeName;
  int? id;

  Items({this.routeName, this.id});

  Items.fromJson(Map<String, dynamic> json) {
    routeName = json['routeName']??'';
    id = json['id']??'';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['routeName'] = routeName;
    data['id'] = id;
    return data;
  }
}
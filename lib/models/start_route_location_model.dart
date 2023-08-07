import 'dart:convert';

GetStartRouteLocation getStartRouteModel(String str)=>GetStartRouteLocation.fromJson(jsonDecode(str));
class GetStartRouteLocation {
  List<Items>? items;
  String? status;
  String? message;
  int? totalCount;

  GetStartRouteLocation({this.items, this.status, this.message, this.totalCount});

  factory GetStartRouteLocation.fromJson(Map<String, dynamic> json) {
    return GetStartRouteLocation(
    items: List<Items>.from(json['items'].map((e)=>Items.fromJson(e))),
    status : json['status'],
    message : json['message'],
    totalCount :json['totalCount'],
    );
}
}

class Items {
  String? startLocation;
  String? createdDate;
  int? id;

  Items({this.startLocation,this.createdDate, this.id});

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      startLocation : json['startLocation'],
      createdDate: json['createdDate'],
      id : json['id']
    );
  }
}
import 'dart:convert';

GetEndRouteLocation getEndRouteModel(String str)=>GetEndRouteLocation.fromJson(jsonDecode(str));
class GetEndRouteLocation {
  List<Items>? items;
  String? status;
  String? message;
  int? totalCount;

  GetEndRouteLocation({this.items, this.status, this.message, this.totalCount});

  factory GetEndRouteLocation.fromJson(Map<String, dynamic> json) {
    return GetEndRouteLocation(
    items: List<Items>.from(json['items'].map((e)=>Items.fromJson(e))),
    status : json['status'],
    message : json['message'],
    totalCount :json['totalCount'],
    );
}
}

class Items {
  String? endLocation;
  int? id;

  Items({this.endLocation, this.id});

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      endLocation : json['endLocation'],
      id : json['id']
    );
  }
}
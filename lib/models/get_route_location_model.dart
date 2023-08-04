
import 'dart:convert';

GetRouteLocation getRouteLocationFromModel(String str)=>GetRouteLocation.fromJson(jsonDecode(str));
class GetRouteLocation {
  List<Items>? items;
  String? status;
  String? message;
  int? totalCount;

  GetRouteLocation({this.items, this.status, this.message, this.totalCount});

  factory GetRouteLocation.fromJson(Map<String, dynamic> json) {
    return GetRouteLocation(
    // if (json['items'] != null) {
    //   items = <Items>[];
    //   json['items'].forEach((v) {
    //     items!.add(new Items.fromJson(v));
    //   });
    // }
      items: List<Items>.from(json['items'].map((e)=>Items.fromJson(e))),
      status : json['status'],
      message : json['message'],
      totalCount : json['totalCount']
    );
  }
}

class Items {
  String? startLocation;
  String? createdDate;
  int? id;

  Items({this.startLocation, this.createdDate, this.id});

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
        startLocation : json['startLocation']??" ",
        createdDate : json['createdDate']??" ",
        id : json['id']??" "
    );
  }
}
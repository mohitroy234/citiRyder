
import 'dart:convert';

GetAllLocationRoute getAllLocationRouteFromModel(String str)=>GetAllLocationRoute.fromJson(jsonDecode(str));
class GetAllLocationRoute {
  List<Items>? items;
  String? status;
  String? message;
  int? totalCount;

  GetAllLocationRoute({this.items, this.status, this.message, this.totalCount});

  factory GetAllLocationRoute.fromJson(Map<String, dynamic> json) {
    return GetAllLocationRoute(
    items:List <Items>.from(json['items'].map((e) => Items.fromJson(e))),
    status : json['status'],
    message : json['message'],
    totalCount : json['totalCount'],
    );
  }
}

class Items {
  String? locationName;
  String? locationAlterName;
  int? latitude;
  int? longitude;
  Null? stops;
  int? id;
  String? createdDate;
  Null? modifiedDate;
  Null? createdBy;
  Null? modifiedBy;
  Null? cancelled;

  Items(
      {this.locationName,
        this.locationAlterName,
        this.latitude,
        this.longitude,
        this.stops,
        this.id,
        this.createdDate,
        this.modifiedDate,
        this.createdBy,
        this.modifiedBy,
        this.cancelled});

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
        locationName : json['locationName']??'',
        locationAlterName : json['locationAlterName']??'',
        latitude : json['latitude']??'',
        longitude : json['longitude']??'',
        stops : json['stops']??'',
        id : json['id']??'',
        createdDate : json['createdDate']??'',
        modifiedDate : json['modifiedDate']??'',
        createdBy : json['createdBy']??'',
        modifiedBy : json['modifiedBy']??'',
        cancelled : json['cancelled']??'',
    );
  }
}
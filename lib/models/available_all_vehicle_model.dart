
import 'dart:convert';

GetAllAvailableVehicles getAvailableVehiclesfromModel(String str)=>GetAllAvailableVehicles.fromJson(jsonDecode(str));
class GetAllAvailableVehicles {
  List<Items>? items;
  String? status;
  String? message;
  int? totalCount;

  GetAllAvailableVehicles(
      {this.items, this.status, this.message, this.totalCount});

  factory GetAllAvailableVehicles.fromJson(Map<String, dynamic> json) {
    return GetAllAvailableVehicles(
    // if (json['items'] != null) {
    //   items = <Items>[];
    //   json['items'].forEach((v) {
    //     items!.add(new Items.fromJson(v));
    //   });
    // }
    items:List <Items>.from(json['items'].map((e)=> Items.fromJson(e))),
    status : json['status'],
    message : json['message'],
    totalCount : json['totalCount']
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
  String? locationName;
  String? locationAlterName;
  int? latitude;
  int? longitude;
  String? stops;
  int? id;
  String? createdDate;
  String? modifiedDate;
  String? createdBy;
  String? modifiedBy;
  String? cancelled;

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

  factory  Items.fromJson(Map<String, dynamic> json) {
    return Items(
        locationName : json['locationName'],
        locationAlterName : json['locationAlterName'],
        latitude : json['latitude'],
        longitude : json['longitude'],
        stops : json['stops'],
        id : json['id'],
        createdDate : json['createdDate'],
        modifiedDate : json['modifiedDate'],
        createdBy : json['createdBy'],
        modifiedBy : json['modifiedBy'],
        cancelled : json['cancelled']
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locationName'] = locationName;
    data['locationAlterName'] = locationAlterName;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['stops'] = stops;
    data['id'] = id;
    data['createdDate'] = createdDate;
    data['modifiedDate'] = modifiedDate;
    data['createdBy'] = createdBy;
    data['modifiedBy'] = modifiedBy;
    data['cancelled'] = cancelled;
    return data;
  }
}
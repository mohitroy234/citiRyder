class GetEndRouteLocation {
  List<Items>? items;
  String? status;
  String? message;
  int? totalCount;

  GetEndRouteLocation({this.items, this.status, this.message, this.totalCount});

  GetEndRouteLocation.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
    status = json['status'];
    message = json['message'];
    totalCount = json['totalCount'];
  }
}

class Items {
  String? endLocation;
  int? id;

  Items({this.endLocation, this.id});

  Items.fromJson(Map<String, dynamic> json) {
    endLocation = json['endLocation'];
    id = json['id'];
  }
}
//
// import 'dart:convert';
//
// BuyPass buyPassFromModel(String str)=>BuyPass.fromJson(jsonDecode(str));
// class BuyPass {
//   List<Items>? items;
//   String? status;
//   String? message;
//   int? totalCount;
//
//   BuyPass({this.items, this.status, this.message, this.totalCount});
//
//   BuyPass.fromJson(Map<String, dynamic> json) {
//     if (json['items'] != null) {
//       items = <Items>[];
//       json['items'].forEach((v) {
//         items!.add(new Items.fromJson(v));
//       });
//     }
//     status = json['status'];
//     message = json['message'];
//     totalCount = json['totalCount'];
//   }
// }
// class Items{
//   factory Items.fromJson(Map<String, dynamic>json){
//     return Items(
//
//     );
//   }
// }
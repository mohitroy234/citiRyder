import 'dart:convert';

import 'package:citi_ryder/models/available_all_vehicle_model.dart';
import 'package:citi_ryder/models/available_vehicles_model.dart';
// import 'package:citi_ryder/models/buy_pass_model.dart';
import 'package:citi_ryder/models/get_location_route_model.dart';
import 'package:citi_ryder/models/get_route_location_model.dart';
import 'package:citi_ryder/models/login_response.dart';
import 'package:http/http.dart' as http;

class Apihandler{
  String baseUrl="https://riderapi.bludust.in";
  var headers={"Content-Type":"application/json"};


  Future<AvailableVehicles> getAvailableVechiles() async{
    try{
      Uri url=Uri.parse("${baseUrl}/v1/api/AvailableVehiclesApp/GetRouteName");
      http.Response response=await http.get(url,headers: headers);
      print(response.body);
      if(response.statusCode==200){
        var res=availableVehiclesResponse(response.body);
        return res;
      }else{
        throw ErrorResponse(message: "Error occurred");
      }
    }
    catch(e){
      throw ErrorResponse(message:e.toString());
    }
  }

  Future<GetAllAvailableVehicles> getAllAvailableVechiles() async{
    try{
      Uri url=Uri.parse("${baseUrl}/v1/api/AvailableVehiclesApp/GetAllAvailableVehiclesMaster");
      Map body={
        "pageNo": 0,
        "pageSize": 0,
        "search": "string"
      };
      http.Response response=await http.post(url,headers: headers,body: jsonEncode(body));
      print(response.body);
      if(response.statusCode==200){
        var res=getAvailableVehiclesfromModel(response.body);
        return res;
      }
     else{
        throw ErrorResponse(message: "Error occurred");
      }
    }catch(e){
      throw ErrorResponse(message: e.toString());
    }
  }

  // Future<BuyPass> buyPass() async{
  //   try{
  //     Uri url=Uri.parse("${baseUrl}/v1/api/BuyPassApp/GetAllBuyPassMaster");
  //     Map body={
  //       "pageNo": 0,
  //       "pageSize": 0,
  //       "search": "string"
  //     };
  //     http.Response response=await http.post(url,headers: headers,body: jsonEncode(body));
  //     print(response.body);
  //     if(response.statusCode==200){
  //       var res=buyPassFromModel(response.body);
  //       return res;
  //     }
  //     else{
  //       throw ErrorResponse(message: "Error occurred");
  //     }
  //   }catch(e){
  //     throw ErrorResponse(message: e.toString());
  //   }
  // }
  
  Future<GetAllLocationRoute> getAllLocationRoute() async{
    try{
      Uri url=Uri.parse("${baseUrl}/v1/api/RouteLocationApp/GetAllRouteLocationMaster");
      Map body={
        "pageNo": 0,
        "pageSize": 0,
        "search": "string"
      };
      http.Response response=await http.post(url,headers: headers,body:jsonEncode(body));
      print(response.body);
      if(response.statusCode==200){
        var res=getAllLocationRouteFromModel(response.body);
        return res;
      }else{
        throw ErrorResponse(message: "Error occurred");
      }
    }catch(e){
      throw ErrorResponse(message: e.toString());
    }
  }
  
  Future<GetRouteLocation> getRouteLocation() async{
    try{
      Uri url=Uri.parse("${baseUrl}/v1/api/RouteLocationApp/GetStartLocationDropdown");
      http.Response response= await http.post(url,headers: headers);
      print(response.body);
      if(response.statusCode==200){
        var res=getRouteLocationFromModel(response.body);
        return res;
      }else{
        throw ErrorResponse(message: "Error occurred");
      }
    }catch(e){
      throw ErrorResponse(message: e.toString());
    }
  }
}
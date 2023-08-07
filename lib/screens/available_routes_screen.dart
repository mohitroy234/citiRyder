import 'package:citi_ryder/Api/Api_handler.dart';
import 'package:flutter/material.dart';

class Routes extends StatefulWidget {
  const Routes({Key? key}) : super(key: key);

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
dynamic res;
  @override
  void initState(){
    super.initState();
    print("get all route to location");
    res=Apihandler().getAllLocationRoute();
    print(res["items"]);
    
    print("get all route");
    Apihandler().getRouteLocation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(icon:const Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: true,
        title:const Text("Available routes",style: TextStyle(color: Colors.white,fontSize: 16),),
      ),
      body:ListView(),
    );
  }
}

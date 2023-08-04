import 'package:citi_ryder/Api/Api_handler.dart';
import 'package:citi_ryder/utils/color.dart';
import 'package:flutter/material.dart';

class MyPasses extends StatefulWidget {
  const MyPasses({Key? key}) : super(key: key);

  @override
  State<MyPasses> createState() => _MyPassesState();
}

class _MyPassesState extends State<MyPasses> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(icon:const Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: true,
        title:const Text("My Passes",style: TextStyle(color: Colors.white,fontSize: 16),),
        actions: [
          IconButton(onPressed: (){
            AlertDialog();
          }, icon: Icon(Icons.info,color: Colors.white,))
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: background_color,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("You have not purchased any pass yet!",style: TextStyle(color: Colors.red,fontSize: 14),),
              const SizedBox(height: 10,),
              ElevatedButton(style:ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900
              ),onPressed: (){}, child: Text("BUY PASS",style: TextStyle(color: Colors.white),))
            ],
          ),
        ),
      ),
    );
  }
}

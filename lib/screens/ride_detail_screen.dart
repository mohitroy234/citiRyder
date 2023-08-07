import 'package:citi_ryder/Api/Api_handler.dart';
import 'package:citi_ryder/models/available_all_vehicle_model.dart';
import 'package:citi_ryder/models/available_vehicles_model.dart';
import 'package:citi_ryder/utils/color.dart';
import 'package:flutter/material.dart';

class MyRide extends StatefulWidget {
  const MyRide({Key? key}) : super(key: key);

  @override
  State<MyRide> createState() => _MyRideState();
}

class _MyRideState extends State<MyRide> {

GetAllAvailableVehicles? getAllAvailableVehicles;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print("get all available vechiles");
    // Apihandler().getAllAvailableVechiles();

    // print("get available vechiles");
    // Apihandler().getAvailableVechiles();
    // init();
  }

  // void init()async{
  //   getAllAvailableVehicles=await Apihandler().getAllAvailableVechiles();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(icon:const Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: true,
        title:const Text("My Rides",style: TextStyle(color: Colors.white,fontSize: 16),),
      ),
      body:Container(
        decoration: BoxDecoration(
            gradient: background_color
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Upcoming Rides",style: TextStyle(color: Colors.white,fontSize: 16),),
                  GestureDetector(
                    onTap: (){
                      showModalBottomSheet(context: context, builder: (context)=>buildSheet());
                    },
                    child: Container(
                      width: 100,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        border: Border.all(
                          color: Colors.white
                        )
                      ),
                      child:const Center(
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Filter",style: TextStyle(color: Colors.white,fontSize: 16),),
                              Icon(Icons.filter_list)
                            ],
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20,),
      FutureBuilder<AvailableVehicles>(
        future: Apihandler().getAvailableVechiles(),
        builder: (context,snapshot){
              if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(snapshot.hasError){
            Center(child: Text("An error occured ${snapshot.error}"),);
          }
          else if(snapshot.data == null){
            Center(
                child:Text("No products has been added yet")
            );
          }
          return Expanded(
            child: ListView.builder(
              itemCount:snapshot.data!.items!.length ,
                itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data!.items![index].routeName.toString()));
            }),
          );
        }
        )
            ],
          ),
        )
      ),
    );
  }
  Widget buildSheet(){
    return Container(
      height: 250,
      child: Column(
        children: [
          const ListTile(
            title: Text("Filter Rides",style: TextStyle(color: Colors.grey),),
          ),
          const Divider(color: Colors.deepPurpleAccent,),
          ListTile(
            title: Text("Upcoming Booking",style: TextStyle(color: Colors.black),),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Past Bookings",style: TextStyle(color: Colors.black),),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text("Cancelled Bookings",style: TextStyle(color: Colors.black),),
            onTap: (){
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

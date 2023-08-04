import 'package:citi_ryder/screens/myPass_screen.dart';
import 'package:citi_ryder/screens/navBar_screen.dart';
import 'package:citi_ryder/screens/pickUp_detail_screen.dart';
import 'package:citi_ryder/screens/ride_detail_screen.dart';
import 'package:citi_ryder/screens/support_screen.dart';
import 'package:citi_ryder/utils/color.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        backgroundColor: Color(0xff1d4e89),
        title:const Text('CitiRyder',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: background_color1,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Namaste",style: TextStyle(color: Colors.white,fontSize: 35),),
            SizedBox(height: 5,),
            Text("Mohit Roy",style: TextStyle(color:Colors.white,fontSize: 30),),
            SizedBox(height: 50,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                itemDashboard("Book Ride", Icons.directions_bus,(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>PickUp()));
                }),
                itemDashboard("My Ride", Icons.airport_shuttle,(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyRide()));
                })
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                itemDashboard("My Passes", Icons.airplane_ticket,(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyPasses()));
                }),
                itemDashboard("Support", Icons.headset_mic_outlined,(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Support()));
                }),
              ],
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height*0.25,
              decoration: BoxDecoration(
                  color: Colors.blue.shade800,
                  borderRadius: BorderRadius.zero,
                 boxShadow:const [
                   BoxShadow(
                     color: Colors.black54,
                     spreadRadius: 2,
                     blurRadius: 3,
                   )
                 ]
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Upcoming Services',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  const Text("Shortly we'll be launching the following services",style: TextStyle(fontSize: 16,color: Colors.white),),
                  const SizedBox(height: 8,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding:const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child:const Center(
                          child: Text("LOCAL TAXI",style: TextStyle(color: Colors.white,fontSize: 16),),
                        ),
                      ),
                      Container(
                        padding:const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child:const Center(
                          child: Text("CAR RENTAL",style: TextStyle(color: Colors.white,fontSize: 16),),
                        ),
                      ),
                      Container(
                        padding:const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child:const Center(
                          child: Text("INTERCITY",style: TextStyle(color: Colors.white,fontSize: 16),),
                        ),
                      ),
                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  itemDashboard (String title,IconData iconData,VoidCallback? onClicked)=>GestureDetector(
    onTap: onClicked,
    child: Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xff118ab2),
        borderRadius: BorderRadius.circular(10),
        boxShadow:const [
          BoxShadow(
            color: Colors.black54,
            spreadRadius: 2,
            blurRadius: 3,
          )
        ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.circle
            ),
            child: Icon(iconData,color: Colors.white,size: 50,),
          ),
          const SizedBox(height: 8,),
          Text(title,style:const TextStyle(color: Colors.white,fontSize: 20),)
        ],
      ),
    ),
  );
}

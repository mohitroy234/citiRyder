import 'package:citi_ryder/screens/search_screen.dart';
import 'package:citi_ryder/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class PickUp extends StatefulWidget {
  const PickUp({Key? key}) : super(key: key);

  @override
  State<PickUp> createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {
  TextEditingController plocationController=TextEditingController();
  TextEditingController dlocationController=TextEditingController();
  String Address="";
  DateTime? datePicked=DateTime.now();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }


  Future<void> GetAddress(Position position) async{
    List<Placemark> placemark= await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place=placemark[0];
    Address='${place.administrativeArea},${place.locality}';
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(icon:const Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: true,
        title:const Text("CitiRyder",style: TextStyle(color: Colors.white,fontSize: 16),),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 15,horizontal: 30),
        decoration: BoxDecoration(
          gradient: background_color
        ),
        child: ListView(
          children: [
          Container(
            padding: const EdgeInsets.fromLTRB(8,10, 8, 10),
            width:size.width*0.8,
            height:size.height*0.6,
            decoration: BoxDecoration(
                color:back_color,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow:const [
                  BoxShadow(
                      color: Colors.blueGrey,
                      spreadRadius: 2,
                      blurRadius: 3
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  backgroundColor:Colors.black,
                  radius: 40,
                  backgroundImage: AssetImage("assets/citiryder.png"),
                ),
                const Align(alignment:Alignment.centerLeft,child:Text("Select your Pick and Drop Location",style: TextStyle(color: Colors.blue,fontSize: 16),)),
                const Align(alignment:Alignment.centerLeft,child:Text("Help us to know where you want to go",style: TextStyle(color: Colors.grey,fontSize: 16),)),
                const Divider(),
                GestureDetector(
                  onTap: ()async {
                    Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Search())));
                    Position position=await _determinePosition();
                    GetAddress(position);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical:8.0 ),
                    padding:const EdgeInsets.only(left:8.0,right:8.0,top:10.0,bottom:10.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child:Row(
                      children: [
                        const SizedBox(width: 10,),
                        Icon(Icons.location_on,size: 25,),
                        const SizedBox(width: 10,),
                        Text('Pick up location',style: TextStyle(fontSize: 14,color: Colors.black),),
                      ],
                    ),
                  ),
                ),
                textField(dlocationController, "Drop location", Icons.location_on,(){}),
                const Divider(),
                GestureDetector(
                  onTap: ()async {
                    datePicked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000, 1, 1),
                        lastDate: DateTime(2023, 12, 31));

                    if (datePicked != null) {
                      setState(() {

                      });
                    }
                    else{
                      setState(() {
                        datePicked=DateTime.now();
                      });
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical:8.0 ),
                    padding:const EdgeInsets.only(left:8.0,right:8.0,top:10.0,bottom:10.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Journey date: ${datePicked!.day}-${datePicked!.month}-${datePicked!.year}',style: TextStyle(fontSize: 14,color: Colors.black),),
                        Icon(Icons.calendar_today,size: 30,)
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){

                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical:8.0 ),
                    width: double.infinity,
                    height:50,
                    decoration:BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12.0)
                    ),
                    child:const Center(child: Text("Save & Continue",style: TextStyle(fontSize: 12,color: Colors.white),)),
                  ),
                ),
              ],
            ),
          ),
          ]
        ),
      ),
    );
  }
  Widget textField(TextEditingController controller,String title,IconData iconData,VoidCallback? onClicked){
    return   GestureDetector(
      onTap: onClicked,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical:8.0 ),
        padding:const EdgeInsets.only(left:8.0,right:8.0),
        decoration: BoxDecoration(
          color: Colors.transparent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: TextField(
          controller:controller,
          decoration: InputDecoration(
            hintText:title,
            prefixIcon: Icon(iconData),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}

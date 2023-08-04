import 'package:citi_ryder/screens/available_routes_screen.dart';
import 'package:citi_ryder/screens/dashboard_screen.dart';
import 'package:citi_ryder/screens/myPass_screen.dart';
import 'package:citi_ryder/screens/notification_screen.dart';
import 'package:citi_ryder/screens/profile_screen.dart';
import 'package:citi_ryder/screens/referEarn_screen.dart';
import 'package:citi_ryder/screens/ride_detail_screen.dart';
import 'package:citi_ryder/screens/support_screen.dart';
import 'package:citi_ryder/screens/wallet_screen.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Drawer(
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.zero,
            bottomRight: Radius.zero
          )
        ),
        child: Container(
          color: Colors.white,
          child: Material(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                buildHeader("https://cdn-icons-png.flaticon.com/512/1535/1535791.png", "Mohit Roy", "800253782"),
                buildMenuItem("Home", Icons.home, () {
                  Navigator.pop(context);
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>Dashboard()), (route) => false);
                }),
                buildMenuItem("My Account", Icons.account_circle,(){
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Profile()));
                }),
                buildMenuItem("My Rides", Icons.menu,(){
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyRide()));
                }),
                buildMenuItem("My Coins", Icons.wallet,(){
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Wallet()));
                }),
                buildMenuItem("Notifications", Icons.notifications,(){
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotificationScreen()));
                }),
                buildMenuItem("Refer & Earn", Icons.drive_folder_upload,(){
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReferEarn()));
                }),
                buildMenuItem("Available Routes", Icons.route,(){
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Routes()));
                }),
                buildMenuItem("My Pass", Icons.book_online,(){
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyPasses()));
                }),
                buildMenuItem("Support", Icons.info,(){
                  Navigator.pop(context);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Support()));
                }),
                const Spacer(),
                buildFooter("1.2.0", "Copyright @ 2021 CitiRyder.")
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildMenuItem(String item,IconData iconData,VoidCallback? onClick){
    const color=Colors.black;
    const hoverColor=Colors.grey;

    return ListTile(
      tileColor: Colors.white,
      leading: Icon(iconData,color: color,),
      title: Text(item,style:const TextStyle(color:color),),
      hoverColor: hoverColor,
      onTap: onClick,
    );
  }
  Widget buildHeader(String uri,String name, String phone){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.17,
      color: Colors.blue.shade800,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(radius: 30,backgroundColor: Colors.white,backgroundImage: NetworkImage(uri)),
          const SizedBox(width: 20,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style:const TextStyle(fontSize: 20,color: Colors.white),
              ),
              const SizedBox(height: 5,),
              Text(
                phone,
                style:const TextStyle(fontSize: 16,color: Colors.white),
              )
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width*0.2,),
        ],
      ),
    );
  }

  Widget buildFooter(String version,String base){
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(

        height: MediaQuery.of(context).size.height*0.1,
        padding:const EdgeInsets.symmetric(horizontal: 8.0),
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Align(alignment:Alignment.centerLeft,child: Text("App Version: ${version}",style:const TextStyle(color: Colors.black,fontSize: 16),)),
            const SizedBox(height: 10,),
            Align(alignment:Alignment.centerLeft,child: Text(base,style:const TextStyle(color: Colors.black,fontSize: 16),)),
          ],
        ),
      ),
    );
  }
}

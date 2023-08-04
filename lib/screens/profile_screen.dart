import 'dart:io';

import 'package:citi_ryder/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController companyController=TextEditingController();
  TextEditingController gstController=TextEditingController();
  String? valueChoose;
  List items=[
    "Male",
    "Female",
    "Others"
  ];
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: Colors.blueAccent,
          leading: IconButton(icon:const Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
            Navigator.pop(context);
          },),
          centerTitle: true,
          title:const Text("Profile",style: TextStyle(color: Colors.white,fontSize: 16),),
        ),
      body:Container(
        decoration: BoxDecoration(
          gradient: background_color,
        ),
        child:SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child: ListView(
            children: [
              Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        image !=null?Container(
                          decoration:const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: ClipOval(
                            child: SizedBox.fromSize(
                              size:const Size.fromRadius(110),
                              child: Image.file(image!),
                            ),
                          ),
                        ):const CircleAvatar(
                          backgroundImage: NetworkImage("https://cdn-icons-png.flaticon.com/512/1535/1535791.png"),
                          backgroundColor: Colors.white,
                          radius: 100,
                        ),
                        Positioned(
                            bottom: MediaQuery.of(context).size.height*0.01,
                            right: MediaQuery.of(context).size.width*0.02,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: IconButton(
                                icon:const Icon(Icons.add,size: 30,color: Colors.black,),
                                onPressed: (){
                                  showModalBottomSheet(context: context, builder: (context)=>buildSheet());
                                },
                              ),
                            )
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  listTile("EDIT PROFILE", Icons.person, Icons.edit, Colors.black,(){
                    showDialog(context: context, builder: ((context) {
                      return StatefulBuilder(
                        builder: (BuildContext context,StateSetter setState)
                         {
                           return AlertDialog(
                             title:const Text("Edit your details"),
                             content: SizedBox(
                               height: MediaQuery.of(context).size.height*0.4,
                               width: MediaQuery.of(context).size.width*0.6,
                               child: Column(
                                 children: [
                                   textField(nameController, "Enter your name", Icons.person),
                                   textField(emailController, "Enter your Email", Icons.email),
                                   Container(
                                     width: double.infinity,
                                     margin: const EdgeInsets.symmetric(vertical:8.0 ),
                                     padding:const EdgeInsets.only(left:8.0,right:8.0),
                                     decoration: BoxDecoration(
                                       color: Colors.transparent.withOpacity(0.1),
                                       borderRadius: BorderRadius.circular(12.0),
                                     ),
                                     child: DropdownButton(
                                       padding:EdgeInsets.only(left: 10),
                                       hint: Text("Gender"),
                                       underline: SizedBox(),
                                       isExpanded: true,
                                       dropdownColor: Colors.white,
                                       icon: Icon(Icons.arrow_drop_down),
                                       iconSize: 30,
                                       style:const TextStyle(color: Colors.black,
                                           fontSize: 16),
                                       onChanged: (newValue){
                                         setState(() {
                                           valueChoose=newValue as String?;
                                         });
                                       },value: valueChoose,
                                       items: items.map((value) {
                                         return DropdownMenuItem(value:value,child: Text(value));
                                       }).toList(),),
                                   ),
                                   textField(companyController, "Enter your company name", Icons.home_work_rounded),
                                   textField(gstController, "Enter the GST no.", Icons.insert_drive_file_rounded),
                                 ],
                               ),
                             ),
                             actions: [
                               TextButton(style:TextButton.styleFrom(
                                   backgroundColor: Colors.blue
                               ),onPressed: (){
                                 Navigator.pop(context);
                               }, child: Text("Save")),
                               TextButton(style:TextButton.styleFrom(
                                   backgroundColor: Colors.red
                               ),onPressed: (){
                                 Navigator.pop(context);
                               }, child: Text("Cancel"))
                             ],
                           );
                         }
                      );
                    }));
                  }),
                  listTile("ADDRESS", Icons.location_on, Icons.edit, Colors.black,(){}),
                  listTile("CHANGE PASSWORD", Icons.key, Icons.edit, Colors.black,(){}),
                  listTile("SET SOS NUMBER", Icons.error, Icons.edit, Colors.black,(){}),
                  listTile("TRAVELLING DETAILS", Icons.travel_explore, Icons.edit, Colors.black,(){}),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      decoration:BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                          boxShadow:const [
                            BoxShadow(
                                offset: Offset(0,5),
                                spreadRadius: 2,
                                blurRadius: 3,
                                color: Colors.black54
                            )
                          ]
                      ),
                      child:const ListTile(
                        leading: Icon(Icons.logout,color: Colors.red,),
                        title: Text("LOGOUT",style: TextStyle(color: Colors.red),),
                      ),
                    ),
                  )
                ],
              ),
            ],
            ),
          ),
        ),
      )
    );
  }
  Widget listTile(String text,IconData ficonData,IconData biconData,Color color,VoidCallback? onClicked){
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow:const [
          BoxShadow(
            offset: Offset(0,5),
            spreadRadius: 2,
            blurRadius: 3,
            color: Colors.black54
          )
        ]
      ),
      child: ListTile(
        leading: Icon(ficonData,color: color,),
        title: Text(text,style: TextStyle(color: color),),
        trailing: IconButton(icon: Icon(biconData),onPressed: onClicked,),
      ),
    );
  }

  Widget textField(TextEditingController controller,String title,IconData iconData){
    return   Container(
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
    );
  }


  Widget buildSheet(){
    return Container(
      height: 130,
      child: Column(
        children: [
           ListTile(
            title: Text("Camera",style: TextStyle(color: Colors.black),),
            trailing: Icon(Icons.camera),
            onTap: (){
                capture(context, ImageSource.camera);
            },
          ),
          ListTile(
            title: Text("Gallery",style: TextStyle(color: Colors.black),),
            trailing: Icon(Icons.photo),
            onTap: (){
                capture(context, ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }

  Future capture(BuildContext context,ImageSource source) async{
    final media=await ImagePicker().getImage(source: source);
    final file=File(media!.path);
    setState(() {
      image=file;
    });
    Navigator.pop(context);
  }
}

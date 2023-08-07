
import 'dart:convert';
import 'package:citi_ryder/models/login_response.dart';
import 'package:http/http.dart' as http;
import 'package:citi_ryder/screens/dashboard_screen.dart';
import 'package:citi_ryder/screens/register_screen.dart';
import 'package:citi_ryder/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:citi_ryder/models/error_response_model.dart';


class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController phoneController=TextEditingController();
  TextEditingController passController=TextEditingController();
  bool value=true;
  Color color=Colors.blue;

  Future<LoginResponse> loginWithMobile(String mobile,String password) async{
    var headers={"Content-Type":"application/json"};
     try{
       Uri url=Uri.parse("https://riderapi.bludust.in/v1/api/RegisterApp/Login");

       Map body={
         "mobile":mobile,
         "password":password
       };
       http.Response response=await http.post(url,body: jsonEncode(body),headers: headers);
       if(response.statusCode==200){
         final json=loginResponseFromModel(response.body);
         return json;
       }
       else{
          throw ErrorResponse(message: "User do not exist");
       }
     }catch(e){
            throw ErrorResponse(message: e.toString());
     }
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding:const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: background_color,
        ),
        child:Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.fromLTRB(8,10, 8, 10),
                width:size.width*0.8,
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
                    Container(
                      margin: const EdgeInsets.symmetric(vertical:8.0 ),
                      padding:const EdgeInsets.only(left:8.0,right:8.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: phoneController,
                        decoration:const InputDecoration(
                          hintText: "Phone no.",
                          prefixIcon: Icon(Icons.phone),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical:8.0 ),
                      padding:const EdgeInsets.only(left:8.0,right:8.0),
                      decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: TextField(
                        controller: passController,
                        obscureText: value,
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: InputBorder.none,
                          prefixIcon:const Icon(Icons.lock),
                          suffixIcon: IconButton(icon: Icon(Icons.remove_red_eye,color: color,),onPressed: (){
                            if(value){
                              setState(() {
                                value=false;
                                color=Colors.grey;
                              });
                            }
                            else{
                              setState(() {
                                value=true;
                                color=Colors.blue;
                              });
                            }
                          },)
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async{
                       final res=await loginWithMobile(phoneController.text.toString(), passController.text.toString());
                       if(res.status=='1'){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard()));
                       }else{
                         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("User do not exist")));
                       }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical:8.0 ),
                        width: double.infinity,
                        height:50,
                        decoration:BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12.0)
                        ),
                        child:const Center(child: Text("Login",style: TextStyle(fontSize: 16,color: Colors.white),)),
                      ),
                    ),
                    const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Divider(color: Colors.black,thickness: 2,indent: 10,endIndent: 10),
                      Text("Or",style: TextStyle(color: Colors.grey,fontSize: 12),),
                      Divider(color: Colors.black,thickness: 2,indent: 10,endIndent: 10),
                    ],),
                    GestureDetector(
                      onTap: (){
                        showDialog(context: context, builder: ((context) {
                          return AlertDialog(
                            title:const Text("Enter the OTP"),
                            content: SizedBox(
                              height: 150,
                              width: size.width*0.4,
                              child: Pinput(
                                length: 4,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                defaultPinTheme: PinTheme(
                                    height: 50,
                                    width: 50,
                                    textStyle:const TextStyle(
                                        fontSize: 24,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent.withOpacity(0.1),
                                        border: Border.all(
                                          color: Colors.black.withOpacity(0.5),
                                          width: 1.0,
                                        )
                                    )
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(style:TextButton.styleFrom(
                                  backgroundColor: Colors.blue
                              ),onPressed: (){
                                Navigator.pop(context);
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Dashboard()));
                              }, child:const Text("Verify",style: TextStyle(color: Colors.white),)),
                              TextButton(style:TextButton.styleFrom(
                                backgroundColor: Colors.red
                              ),onPressed: (){
                                Navigator.pop(context);
                              }, child:const Text("Cancel",style: TextStyle(color: Colors.white),))
                            ],
                          );
                        }));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical:8.0 ),
                        width: double.infinity,
                        height:50,
                        decoration:BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(12.0)
                        ),
                        child:const Center(child: Text("Login with OTP",style: TextStyle(fontSize: 16,color: Colors.white),)),
                      ),
                    ),
                    GestureDetector(onTap: (){},child:const Text("Forgot Password?",style: TextStyle(color: Colors.blue,fontSize: 12),)),
                    GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Register())));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical:8.0 ),
                        width: size.width*0.7,
                        height:50,
                        decoration:BoxDecoration(
                            gradient:const LinearGradient(
                              colors: [
                                Colors.blue,
                                Colors.blueGrey
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter
                            ),
                            borderRadius: BorderRadius.circular(16.0)
                        ),
                        child:const Center(child: Text("Register with us",style: TextStyle(fontSize: 16,color: Colors.white),)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

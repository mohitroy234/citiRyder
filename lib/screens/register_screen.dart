import 'dart:convert';

import 'package:citi_ryder/models/register_response.dart';
import 'package:citi_ryder/screens/dashboard_screen.dart';
import 'package:http/http.dart' as http;
import 'package:citi_ryder/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:citi_ryder/models/error_response_model.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController phoneController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passController=TextEditingController();
  TextEditingController pinController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController referralController=TextEditingController();
  bool hide=true;
  String? valueChoose;
  List items=[
    "Male",
    "Female",
    "Others"
  ];

  Future<RegisterResponse> registerWithMobile(String mobile,String name,String email,String pin,String address,String referral) async{
    var headers={"Content-Type":"application/json"};
    try{
      Uri url=Uri.parse("https://riderapi.bludust.in/v1/api/RegisterApp/Register");

      Map body={
        "mobile":mobile,
        "password":"123456",
        "name":name,
        "email":email,
        "gender":valueChoose,
        "pin":pin,
        "address":address,
        "referral":referral
      };
      http.Response response=await http.post(url,body: jsonEncode(body),headers: headers);
      if(response.statusCode==200){
        final json=registerResponseFromModel(response.body);
        print(response.body);
        return json;
      }
      else{
        throw ErrorResponse(message: "Error occurred");
      }
    }catch(e){
      throw ErrorResponse(message: e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        leading: IconButton(icon:const Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: true,
        title:const Text("Register With Us",style: TextStyle(color: Colors.white,fontSize: 16),),
      ),
      body: Container(
        padding:const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          gradient: background_color,
        ),
        child:ListView(
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
                  textField(phoneController, "10 Digit Phone No.", Icons.call),
                  textField(nameController, "Enter your name", Icons.person),
                  textField(emailController, "Enter your email", Icons.email),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical:8.0 ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(Icons.lock),
                        SizedBox(
                          width: size.width*0.5,
                          child: Pinput(
                            length: 4,
                            obscureText: hide,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            defaultPinTheme: PinTheme(
                              height: 50,
                              width: 50,
                              textStyle: TextStyle(
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
                        IconButton(onPressed: (){
                          setState(() {
                            if(hide){
                              hide=false;
                            }
                            else{
                              hide=true;
                            }
                          });
                        }, icon:hide? Icon(Icons.visibility_off):Icon(Icons.visibility))
                      ],
                    )
                  ),
                  textField(pinController, "Enter your pincode", Icons.pin),
                  textField(addressController, "Enter your address", Icons.location_on),
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
                      style: TextStyle(color: Colors.black,
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
                  textField(referralController, "Referral code if any", Icons.favorite),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical:8.0 ),
                    padding:const EdgeInsets.only(left:8.0,right:8.0),
                    child: RichText(text:const TextSpan(text:'By clicking save & continue you are accepting to our ',style: TextStyle(color: Colors.black),children: [
                      TextSpan(
                        text: "Terms & Conditions",
                        style: TextStyle(color: Colors.deepPurpleAccent),
                      )
                    ])),
                  ),
                  GestureDetector(
                    onTap: () async{
                      final res= await registerWithMobile(phoneController.text.toString(), nameController.text.toString(),emailController.text.toString(),pinController.text.toString(),addressController.text.toString(),referralController.text.toString());
                      if(res.code == 1){
                        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => Dashboard())));
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Error occurred")));
                      }
                    },
                    child: Container(
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
                      child:const Center(child: Text("Save & Continue",style: TextStyle(fontSize: 16,color: Colors.white),)),
                    ),
                  ),
                ],
              ),
            ),
          ),
    ]
        ),
      ),
    );
  }
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


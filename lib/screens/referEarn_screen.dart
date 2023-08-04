import 'package:citi_ryder/utils/color.dart';
import 'package:flutter/material.dart';

class ReferEarn extends StatelessWidget {
  const ReferEarn({Key? key}) : super(key: key);

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
        title:const Text("Support",style: TextStyle(color: Colors.white,fontSize: 16),),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: background_color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/refer.png",height: 300,width: double.infinity,fit: BoxFit.fitWidth,),
            const SizedBox(height: 30,),
            const Text("Your Code",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
            const SizedBox(height: 20,),
            Container(
              height: 50,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.transparent.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: Colors.blue.shade800,
                )
              ),
              child:const Center(
                child: Text("REF-037562",style: TextStyle(color: Colors.white,fontSize: 16),),
              ),
            ),
            const SizedBox(height: 30,),
            InkWell(
              onTap: (){
                showDialog(context: context, builder: ((context) {
                  return AlertDialog(
                    title:const Text("Follow these steps") ,
                    content:Container(
                      width: size.width*0.5,
                      height: size.height*0.3,
                      decoration:const BoxDecoration(
                        borderRadius: BorderRadius.zero
                      ),
                      child:const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Align(alignment:Alignment.centerLeft,child: Text("1. Login with CitiRyder.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),)),
                          Align(alignment:Alignment.centerLeft,child: Text("2. Share referral code with your friends.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500))),
                          Align(alignment: Alignment.centerLeft,child: Text("3. Ask your friends to enter your referral code while registering with CitiRyder.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),),
                          Align(alignment: Alignment.centerLeft,child: Text("4. You will get referral amount when your completes 1st ride with us.",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500)),)
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(style:TextButton.styleFrom(
                          backgroundColor: Colors.red
                      ),onPressed: (){
                        Navigator.pop(context);
                      }, child:const Text("Ok",style: TextStyle(color: Colors.white),)),
                    ],
                    );
                }));
              },
                child: const Text("How To Earn?",style: TextStyle(fontSize: 20,color: Colors.white),)),
            const Spacer(),
            const Text("Share your referral link",style: TextStyle(fontSize: 20,color: Colors.white),),
            const SizedBox(height: 20,),
            GestureDetector(
              onTap: (){

              },
              child: Container(
                width: double.infinity,
                height: 60,
                color: Colors.blueAccent,
                child:const Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("SHARE YOUR CODE",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      Icon(Icons.share,size: 30,color: Colors.white,)
                    ],
                  ),
                ) ,
              ),
            )
          ],
        ),
      ),
    );
  }
}

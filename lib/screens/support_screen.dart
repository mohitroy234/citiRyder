import 'package:citi_ryder/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                child:const Text("We try our level best to give you top class support by connecting you to a real human",style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.start,),
              ),
              const SizedBox(height: 20,),
              Container(
                child:const Text("Call us on the below numbers and talk to our support executives for any of your query or problem",style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.start,),
              ),
              const SizedBox(height: 50,),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                height: size.height*0.2,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  boxShadow:const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 2,
                      blurRadius: 3
                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Route,Vechile,Stoppage Related Query?",style: TextStyle(color: Colors.white,fontSize: 25),textAlign: TextAlign.start,),
                    GestureDetector(
                      onTap: () async{
                        final Uri url=Uri(
                          scheme: 'tel',
                          path: "6262680000"
                        );
                        if(await canLaunchUrl(url)){
                          await launchUrl(url);
                        }else{
                          print("cannot launch");
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade900,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child:const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("Call us on 6262680000",style: TextStyle(fontSize: 25,color: Colors.white),),
                              Icon(Icons.call,size: 30,color: Colors.white,)
                            ],
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                height: size.height*0.2,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    boxShadow:const [
                      BoxShadow(
                          color: Colors.black54,
                          spreadRadius: 2,
                          blurRadius: 3
                      )
                    ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text("Booking Related Query?",style: TextStyle(color: Colors.white,fontSize: 25),textAlign: TextAlign.start,),
                    GestureDetector(
                      onTap: () async{
                        final Uri url=Uri(
                            scheme: 'tel',
                            path: "7844860000"
                        );
                        if(await canLaunchUrl(url)){
                        await launchUrl(url);
                        }else{
                        print("cannot launch");
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child:const Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Call us on 7844860000",style: TextStyle(fontSize: 25,color: Colors.white),),
                                Icon(Icons.call,size: 30,color: Colors.white,)
                              ],
                            )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40,),
              InkWell(onTap: (){},child:const Text("Terms and conditions",style: TextStyle(color: Colors.white,fontSize: 16),),)
            ],
          ),
        ),
      ),
    );
  }
}

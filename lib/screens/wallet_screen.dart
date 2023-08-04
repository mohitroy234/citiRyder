import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  TextEditingController coinController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        backgroundColor:Colors.blueAccent,
        leading: IconButton(icon:const Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: true,
        title:const Text("My Wallet",style: TextStyle(color: Colors.white,fontSize: 16),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text("Your Coins",style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.left,),
                  RichText(text:const TextSpan(
                    children:[
                      TextSpan(
                        text: "Available Balance : ",
                        style: TextStyle(color: Colors.white,fontSize: 16,)
                      ),
                      TextSpan(
                          text: "0.00",
                          style: TextStyle(color: Colors.black,fontSize: 16)
                      )
                    ]
                  ))
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.wallet,size: 40,color: Colors.white,),
                  Text("1 coin = ₹1",style: TextStyle(color: Colors.white,fontSize: 16),)
                ],
              )
            ],
          ),
          const SizedBox(height: 20,),
          Container(
            width: size.width*0.7,
            margin: const EdgeInsets.symmetric(vertical:8.0 ),
            padding:const EdgeInsets.only(left:8.0,right:8.0),
            decoration: BoxDecoration(
              color: Colors.transparent.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: TextField(
              controller:coinController,
              keyboardType: TextInputType.number,
              decoration:const InputDecoration(
                hintText:"Number of coins",
                hintStyle: TextStyle(color: Colors.white),
                prefixIcon: Icon(Icons.currency_rupee,color: Colors.white,),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: (){
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical:8.0 ),
              width: size.width*0.7,
              height:50,
              decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0)
              ),
              child:const Center(child: Text("Proceed to buy coin ->",style: TextStyle(fontSize: 16,color: Colors.black),)),
            ),
          ),
          const Spacer(),
          Container(
          width: double.infinity,
          height: size.height*0.5,
          decoration:const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0)
            ),
          ),
          padding:const  EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Check Transaction",style: TextStyle(color: Colors.black,fontSize: 16),),
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
                                color: Colors.black
                            )
                        ),
                        child:const Center(
                            child:Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Filter",style: TextStyle(color: Colors.black,fontSize: 16),),
                                Icon(Icons.filter_list)
                              ],
                            )),
                      ),
                    )
                  ],
                ),
                const Divider(),
                Expanded(child: ListView(),),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget buildSheet(){
    return ListView(
      children: [
        Column(
          children: [
            const ListTile(
              title: Text("Filter Transactions",style: TextStyle(color: Colors.grey),),
            ),
            const Divider(color: Colors.deepPurpleAccent,),
            ListTile(
              title: Text("All",style: TextStyle(color: Colors.black),),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Seat Booking",style: TextStyle(color: Colors.black),),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Wallet Recharge",style: TextStyle(color: Colors.black),),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Referral",style: TextStyle(color: Colors.black),),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Refund",style: TextStyle(color: Colors.black),),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Manual Addition",style: TextStyle(color: Colors.black),),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Manual Deduction",style: TextStyle(color: Colors.black),),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Rewards",style: TextStyle(color: Colors.black),),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text("Pass Purchase",style: TextStyle(color: Colors.black),),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ],
    );
  }
}

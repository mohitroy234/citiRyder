import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(icon:const Icon(Icons.arrow_back,color: Colors.white,),onPressed: (){
          Navigator.pop(context);
        },),
        centerTitle: true,
        title:const Text("Search Location",style: TextStyle(color: Colors.white,fontSize: 16),),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
        Container(
        margin: const EdgeInsets.symmetric(vertical:8.0 ),
        padding:const EdgeInsets.only(left:8.0,right:8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: TextField(
          controller:searchController,
          decoration: InputDecoration(
            hintText:"Type here to search",
            suffixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
        ),
      )
          ],
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:realeastapp/utils/app_assets.dart';
import 'package:realeastapp/utils/tripple_rail.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Column(children: [
        // const SizedBox(height: 30,),
        TrippleRail(
          leading: Container(
            height: 50.0,
            width: 61,
            decoration: const  BoxDecoration(
              color: Color(0xffF5F4F8),
              borderRadius: BorderRadius.only(
                topLeft:Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )
            ),
            child: Center(child:SvgPicture.asset(AppAssets.back) ,),
          ),
          middle: Text("Search results", style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Co),),
          leadingExpanded: true,
          trailExpanded: true,

          trailing: Container(
            height: 50.0,
            width: 61,
            decoration: const  BoxDecoration(
              color: Color(0xffF5F4F8),
              borderRadius: BorderRadius.only(
                topLeft:Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              )
            ),
            child: Center(child:SvgPicture.asset(AppAssets.settings) ,),
          ),
        )
        
        
        
            ],),
      ),);
  }
}
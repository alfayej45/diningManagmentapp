import 'package:diningmanagement/view/allmeal.dart';
import 'package:diningmanagement/view/allmealhere.dart';
import 'package:diningmanagement/view/dinnermeal.dart';
import 'package:diningmanagement/view/dinnermealhere.dart';
import 'package:diningmanagement/view/lunchmeal.dart';
import 'package:diningmanagement/view/lunchmealhere.dart';
import 'package:diningmanagement/view/morningmeal.dart';
import 'package:diningmanagement/view/morningmealhere.dart';
import 'package:flutter/material.dart';

class MealHere extends StatefulWidget {
  const MealHere({ Key? key }) : super(key: key);

  @override
  _MealHereState createState() => _MealHereState();
}

class _MealHereState extends State<MealHere>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }


  // List<String> foodimage = [
    
  //            "https://im.rediff.com/money/2014/sep/19sundar4.jpg",
  //            "https://im.rediff.com/money/2014/sep/19sundar4.jpg",
  //            "https://im.rediff.com/money/2014/sep/19sundar4.jpg",
  //            "https://im.rediff.com/money/2014/sep/19sundar4.jpg",
  //            "https://im.rediff.com/money/2014/sep/19sundar4.jpg",
  //            "https://im.rediff.com/money/2014/sep/19sundar4.jpg",
                   

  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Meal Here"),
      // ),

      // ,






      body: 
               Container(
                 height: MediaQuery.of(context).size.height,
                 child: DefaultTabController(length: 4, child: Scaffold(
                   appBar: AppBar(
                      title: Text('Meal Here'),
                      centerTitle: true,
                     bottom: TabBar(
                      // indicatorSize: TabBarIndicatorSize.tab,
                       tabs: [
                          Tab(icon: Icon(Icons.food_bank), text: "AllTime"),
                          Tab(icon: Icon(Icons.breakfast_dining), text: "Morning"),
                          Tab(icon: Icon(Icons.lunch_dining), text: "Lunch"),
                          Tab(icon: Icon(Icons.dinner_dining),text: "Dinner"),
                        //  Tab(icon: Icon(Icons.male_outlined),child: Text("All"),),
                        //  Tab(icon: Icon(Icons.male_outlined),child: Text("All"),),
                        //  Tab(icon: Icon(Icons.male_outlined),child: Text("All"),),
                        //  Tab(icon: Icon(Icons.male_outlined),child: Text("All"),),
                        //   Tab(child: Text("All"),),
                        //  Tab(child: Text("Morning"),),
                        //  Tab(child: Text("Lunch"),),
                        //  Tab(child: Text("Dinner"),),
                     ],
                     ),
                   ),
                   body: TabBarView(children: [

                    AllMealHere(),
                    MorningMealHere(),
                    LunchMealHere(),
                    DinnerMealHere(),



                   ]),

                 )),
               ),
    );
  }
}
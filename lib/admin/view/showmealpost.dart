import 'package:diningmanagement/admin/view/allmealpost.dart';
import 'package:diningmanagement/admin/view/dinnermealpost.dart';
import 'package:diningmanagement/admin/view/lunchmealpost.dart';
import 'package:diningmanagement/admin/view/morningmealpost.dart';
import 'package:flutter/material.dart';

class ShowMealPost extends StatefulWidget {
  ShowMealPost({Key? key}) : super(key: key);

  @override
  State<ShowMealPost> createState() => _ShowMealPostState();
}

class _ShowMealPostState extends State<ShowMealPost> {

//  List<String> foodimage = [
    
//              "https://im.rediff.com/money/2014/sep/19sundar4.jpg",
//              "https://im.rediff.com/money/2014/sep/19sundar4.jpg",
//              "https://im.rediff.com/money/2014/sep/19sundar4.jpg",
//              "https://im.rediff.com/money/2014/sep/19sundar4.jpg",
//              "https://im.rediff.com/money/2014/sep/19sundar4.jpg",
//              "https://im.rediff.com/money/2014/sep/19sundar4.jpg",
                   

//   ];


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
                      title: Text('Total Post Meal : 200'),
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

                    AllMealPost(),
                    MorningMealPost(),
                    LunchMealPost(),
                    DinnerMealPost(),



                   ]),

                 )),
               ),
    );



  }
}
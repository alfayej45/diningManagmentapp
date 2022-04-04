import 'package:diningmanagement/admin/view/allconfirmmeal.dart';
import 'package:diningmanagement/admin/view/diningaccount.dart';
import 'package:diningmanagement/admin/view/dinnerconfirmmeal.dart';
import 'package:diningmanagement/admin/view/lunchconfirmmeal.dart';
import 'package:diningmanagement/admin/view/mealpost.dart';
import 'package:diningmanagement/admin/view/morningconfirmmeal.dart';
import 'package:diningmanagement/admin/view/showmealpost.dart';
import 'package:diningmanagement/admin/view/uerbalanceloadrequest.dart';
import 'package:diningmanagement/view/allmeal.dart';
import 'package:diningmanagement/view/allmealhere.dart';
import 'package:diningmanagement/view/dinnermeal.dart';
import 'package:diningmanagement/view/dinnermealhere.dart';
import 'package:diningmanagement/view/login.dart';
import 'package:diningmanagement/view/lunchmeal.dart';
import 'package:diningmanagement/view/lunchmealhere.dart';
import 'package:diningmanagement/view/morningmeal.dart';
import 'package:diningmanagement/view/morningmealhere.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({ Key? key }) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome>
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
   Future<void> logout(BuildContext context)async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.green,
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                          Container(
              alignment: Alignment.bottomCenter,
              color: Colors.green,
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Text("Dining", style: TextStyle(color: Colors.red, fontSize: 50)),

            ),
                    Container(
              alignment: Alignment.topCenter,
              color: Colors.green,
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Text("Management", style: TextStyle(color: Colors.red, fontSize: 50)),

            ),
         
                ],
              ),

            ),

               InkWell(
                 onTap: (){
                   Navigator.pop(context);
                 },
                 child: ListTile(
                             leading: Icon(Icons.home),
                             title: Text("Home"),
                             trailing: Icon(Icons.arrow_forward_ios),
                           ),
               ),
               InkWell(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> DiningAccount()));
                 },
                 child: ListTile(
                             leading: Icon(Icons.account_balance),
                             title: Text("Dining Account"),
                             trailing: Icon(Icons.arrow_forward_ios),
                           ),
               ),
               InkWell(
                 onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MealPostHere()) );

                 },
                 child: ListTile(
                             leading: Icon(Icons.no_meals),
                             title: Text("Meal Post"),
                             trailing: Icon(Icons.arrow_forward_ios),
                           ),
               ),
                 InkWell(
                 onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowMealPost()) );

                 },
                 child: ListTile(
                             leading: Icon(Icons.set_meal),
                             title: Text("Show Meal Post"),
                             trailing: Icon(Icons.arrow_forward_ios),
                           ),
               ),
               InkWell(
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (Context)=> BalanceLoadUserRequest()));
                 },
                 child: ListTile(
                             leading: Icon(Icons.balcony_sharp),
                             title: Text("User Balance Load Request"),
                             trailing: Icon(Icons.arrow_forward_ios),
                           ),
               ),
                  InkWell(
                 onTap: (){
                  logout(context);

                 },
                 child: ListTile(
                             leading: Icon(Icons.accessible_forward_outlined),
                             title: Text("Logout Here"),
                             trailing: Icon(Icons.logout),
                           ),
               ),
            
          ],
        ),
      ),
      ),
      appBar: AppBar(
        
        title: Text("Today's List"),
        centerTitle: true,
        elevation: 0.0,
          actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage("https://im.rediff.com/money/2014/sep/19sundar4.jpg"),
                ),
              )
            ],
      ),


       body: ListView(
         shrinkWrap: true,
         primary: false,
         children: [
           Padding(
             padding: const EdgeInsets.all(0.0),
             child:
               
//                 new Swiper(
//                  autoplay: true,

//   itemBuilder: (BuildContext context, int index) {

//     return new Image.network(
//       "https://im.rediff.com/money/2014/sep/19sundar4.jpg",
//       //"https://images.unsplash.com/photo-1414235077428-338989a2e8c0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZGluaW5nfGVufDB8fDB8fA%3D%3D&w=1000&q=80",
//       fit: BoxFit.fill,
//     );
//   },
//   itemCount: 5,
//   itemWidth: 300.0,
// ),
          

           
               Container(
                 height: MediaQuery.of(context).size.height,
                 child: DefaultTabController(length: 4, child: Scaffold(
                   appBar: AppBar(
                     
                      title: Text('Total Confirmed Meal : 200'),
                      centerTitle: true,
                     bottom: TabBar(
                       
                      // indicatorSize: TabBarIndicatorSize.tab,
                       tabs: [
                          Tab(icon: Icon(Icons.food_bank), text: "All"),
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
                   body: TabBarView(
                     
                     children: [

                    AllConfirmMeal(),
                    MorningConfirmMeal(),
                    LunchConfirmMeal(),
                    DinnerConfirmMeal(),



                   ]),

                 )),
               ),




           )

         ],
       ),
      
    );
  }
}
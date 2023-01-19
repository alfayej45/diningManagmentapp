import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diningmanagement/admin/view/adminhome.dart';
import 'package:diningmanagement/view/allmeal.dart';

import 'package:diningmanagement/view/balanceload.dart';
import 'package:diningmanagement/view/dinnermeal.dart';
import 'package:diningmanagement/view/firebasedata.dart';

import 'package:diningmanagement/view/login.dart';
import 'package:diningmanagement/view/lunchmeal.dart';

import 'package:diningmanagement/view/mealbookpage.dart';
import 'package:diningmanagement/view/morningmeal.dart';

import 'package:diningmanagement/view/user_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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

  FirebaseAuth firebaseauth = FirebaseAuth.instance;

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('public').snapshots();

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
  }

  final List<String> sliderImageList = [
    "https://image.shutterstock.com/image-photo/close-braised-beef-short-rib-260nw-530248354.jpg",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu3i2TESp1kytB6j2TYwnKQNiM-V-LR9HRblTGsZwbmaS15UwW80TAtUaWnj1h15kcRP0&usqp=CAU",
    "https://media.istockphoto.com/photos/chinese-food-blank-background-picture-id545286388?b=1&k=20&m=545286388&s=170667a&w=0&h=NBSXjfSVP0GdwAOBYELxOFwoYZAXYya1HTGUJYBkh8I=",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCZY1S1QEMVrSK02UTqJE0SyFqR5B5iw4Omg&usqp=CAU",
    "https://us.123rf.com/450wm/rawpixel/rawpixel1604/rawpixel160407711/54701319-food-buffet-catering-dining-eating-party-sharing-concept.jpg?ver=6",
    "https://images.unsplash.com/photo-1547573854-74d2a71d0826?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8Zm9vZCUyMG9uJTIwdGFibGV8ZW58MHx8MHx8&w=1000&q=80",
    "https://media-cdn.tripadvisor.com/media/photo-s/19/79/0f/ff/img-20191002-135723-largejpg.jpg",
  ];
  var box = Hive.box('user');

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
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.indigoAccent,
              // child:  CircleAvatar(
              //   backgroundImage: NetworkImage(document[""]!),
              //   maxRadius: 45,
              //   minRadius: 30,
              // ),
              // child: StreamBuilder(
              //   stream: FirebaseFirestore.instance.collection(""),
              //   builder: ,
              // ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                leading: Icon(Icons.home),
                title: Text("Home"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyAccount()));
              },
              child: ListTile(
                leading: Icon(Icons.people),
                title: Text("My Account"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MealHere()));
              },
              child: ListTile(
                leading: Icon(Icons.no_meals),
                title: Text("Meal here"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BalanceLoadRequestUser()));
              },
              child: ListTile(
                leading: Icon(Icons.balance),
                title: Text("Balance Load"),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
            InkWell(
              onTap: () {
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
      )),

      // StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection("manager").snapshots(),
      //   builder: (context,AsyncSnapshot snapshot){
      //    return ListView.builder(
      //        primary: false,
      //        shrinkWrap: true,
      //        itemCount: snapshot.data!.docs.leanth,
      //        itemBuilder: (context,index){
      //          QueryDocumentSnapshot document=snapshot.data!.docs[index];
      //          return
      //
      //
      //        });
      //   },
      // ),

      appBar: AppBar(
        title: InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (Context)=> AdminHome()));
            },
            child: Text("Home")),
        centerTitle: true,
        actions: [
          // Text(box.get(""image"")??"no image"),
          // Padding(
          //           padding: const EdgeInsets.all(8.0),
          //          child: InkWell(
          //            onTap: (){
          //              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyAccount()));
          //            },
          //            child:CircleAvatar(
          //              radius: 20,
          //              child: ClipRRect(
          //                borderRadius: BorderRadius.circular(90),
          //                child: FutureBuilder(
          //                  future: FireStoreDataBase().getData(),
          //                  builder: (context, snapshot) {
          //                    if (snapshot.hasError) {
          //                      return const Text(
          //                        "Something went wrong",
          //                      );
          //                    }
          //                    if (snapshot.connectionState ==
          //                        ConnectionState.done) {
          //                      return Image.network(
          //                        snapshot.data.toString(),
          //                        fit: BoxFit.cover,
          //                        height: 40,
          //                        width: 80,
          //                        scale: 1.0,
          //                      );
          //                    }
          //                    return const Center(
          //                        child: CircularProgressIndicator());
          //                  },
          //                ),
          //              ),
          //            ),
          //          ),
          //         )
          //  StreamBuilder(
          //    stream: FirebaseFirestore.instance.collection("user").snapshots(),
          //      builder: (context,snapshot){
          //      return Text(data)
          //      })
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyAccount()));
            },
            child: CircleAvatar(
              radius: 15,
              backgroundImage: NetworkImage(box.get("image") ?? ""),
            ),
          )
        ],
      ),

      body: ListView(
        shrinkWrap: true,
        primary: false,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 120,
                child: CarouselSlider(
                  options: CarouselOptions(
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlay: true),
                  items: sliderImageList
                      .map((e) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [Image.network(e, fit: BoxFit.cover)],
                            ),
                          ))
                      .toList(),
                )

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
                ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: DefaultTabController(
                length: 4,
                child: Scaffold(
                  appBar: AppBar(
                    title: Text('My Confirmed Meal'),
                    centerTitle: true,
                    bottom: TabBar(
                      // indicatorSize: TabBarIndicatorSize.tab,
                      tabs: [
                        Tab(icon: Icon(Icons.food_bank), text: "All"),
                        Tab(
                            icon: Icon(Icons.breakfast_dining),
                            text: "Morning"),
                        Tab(icon: Icon(Icons.lunch_dining), text: "Lunch"),
                        Tab(icon: Icon(Icons.dinner_dining), text: "Dinner"),
                      ],
                    ),
                  ),
                  body: TabBarView(children: [
                    AllMeal(),
                    MorningMeal(),
                    LunchMeal(),
                    DinnerMeal(),
                  ]),
                )),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

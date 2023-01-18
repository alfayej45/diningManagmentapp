import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diningmanagement/view/firebasedata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminAccount extends StatefulWidget {
  const AdminAccount({Key? key}) : super(key: key);

  @override
   _AdminAccountState createState() => _AdminAccountState();
}

class _AdminAccountState extends State<AdminAccount>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();

  }

  FirebaseAuth firebaseauth = FirebaseAuth.instance;
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('manager').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("My Info")),
        body: StreamBuilder<QuerySnapshot> (
          stream: FirebaseFirestore.instance.collection("manager").snapshots(),
          builder: (context,snapshots){
            return ListView.builder(
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context,index){
                  QueryDocumentSnapshot document=snapshots.data!.docs[index];
                  return firebaseauth.currentUser!.uid==document['uid']?Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(document["photo"]),

                            // child: ClipRRect(
                            //   borderRadius: BorderRadius.circular(100),

                            // child: FutureBuilder(
                            //   future: FireStoreDataBase().getData(),
                            //   builder: (context, snapshot) {
                            //     if (snapshot.hasError) {
                            //       return const Text(
                            //         "Something went wrong",
                            //       );
                            //     }
                            //     if (snapshot.connectionState ==
                            //         ConnectionState.done) {
                            //       return Image.network(
                            //         snapshot.data.toString(),
                            //         fit: BoxFit.fill,
                            //
                            //         height: 100,
                            //         width: 200,
                            //         scale: 1.0,
                            //       );
                            //     }
                            //     return const Center(
                            //         child: CircularProgressIndicator());
                            //   },
                            // ),
                          ),


                          //                  StreamBuilder<QuerySnapshot>(
                          //   stream: _usersStream,
                          //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          //   if (snapshot.hasError) {
                          //     return Text('Something went wrong');
                          //   }

                          //   if (snapshot.connectionState == ConnectionState.waiting) {
                          //     return Text("Loading");
                          //   }

                          //   else{



                          //   }

                          //   return
                          //   ListView(
                          //     children: snapshot.data!.docs.map((DocumentSnapshot document) {
                          //     Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                          //       return
                          //       Padding(
                          //                 padding: const EdgeInsets.all(16.0),
                          //                 child: Container(
                          //                   height: 90,
                          //                   width: MediaQuery.of(context).size.width,
                          //                   color: Colors.blueGrey[50],
                          //                   child: Column(
                          //                     mainAxisAlignment: MainAxisAlignment.center,
                          //                     crossAxisAlignment: CrossAxisAlignment.center,
                          //                     children: [
                          //                       Text(_usersStream.length.),
                          //                       SizedBox(
                          //                         height: 5,
                          //                       ),
                          //                       Text(data["institude"]),
                          //                       SizedBox(
                          //                         height: 5,
                          //                       ),
                          //                       Text(data["department"]),
                          //                       SizedBox(
                          //                         height: 5,
                          //                       ),
                          //                       Text(data["phone"]),
                          //                     ],
                          //                   ),
                          //                 ),
                          //               );
                          //     }


                          //   ).toList(),
                          //   );


                          //   },
                          // ),

                          Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Container(
                                  height: 90,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.blueGrey[50],
                                  child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text("Name :${document["name"]}"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Institude Name: ${document["institude"]}"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Department Name: ${document["department"]}"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Phone No: ${document["phone"]}"),

                                      ])
                              )
                          ),

                          // Padding(
                          //   padding: const EdgeInsets.all(16.0),
                          //   child: Center(
                          //     child: Container(
                          //       alignment: Alignment.center,
                          //       height: 80,
                          //       width: MediaQuery.of(context).size.width,
                          //       color: Colors.blueGrey[50],
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: [
                          //           // ignore: prefer_const_constructors
                          //           Text("YOUR TOKEN NAME"),
                          //           //Text("megna"),
                          //           Text(firebaseauth.currentUser!.uid),
                          //         ],
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(16.0),
                          //   child: Container(
                          //     height: 90,
                          //     width: MediaQuery.of(context).size.width,
                          //     color: Colors.blueGrey[50],
                          //     child: Column(
                          //       mainAxisAlignment: MainAxisAlignment.center,
                          //       crossAxisAlignment: CrossAxisAlignment.center,
                          //       children: [
                          //         Text(document["currentBalance"]),
                          //
                          //       ],
                          //     ),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ):Container();

                });
          },
        )

      //   ListView(
      //     shrinkWrap: true,
      //     reverse: true,
      //     children: [
      //       Container(
      //         height: MediaQuery.of(context).size.height,
      //         width: MediaQuery.of(context).size.width,
      //         child: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               CircleAvatar(
      //                 radius: 50,
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.circular(100),
      //                   child: FutureBuilder(
      //                     future: FireStoreDataBase().getData(),
      //                     builder: (context, snapshot) {
      //                       if (snapshot.hasError) {
      //                         return const Text(
      //                           "Something went wrong",
      //                         );
      //                       }
      //                       if (snapshot.connectionState ==
      //                           ConnectionState.done) {
      //                         return Image.network(
      //                           snapshot.data.toString(),
      //                           fit: BoxFit.fill,
      //
      //                           height: 100,
      //                           width: 200,
      //                           scale: 1.0,
      //                         );
      //                       }
      //                       return const Center(
      //                           child: CircularProgressIndicator());
      //                     },
      //                   ),
      //                 ),
      //               ),
      //
      //
      //
      // //                  StreamBuilder<QuerySnapshot>(
      // //   stream: _usersStream,
      // //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      // //   if (snapshot.hasError) {
      // //     return Text('Something went wrong');
      // //   }
      //
      // //   if (snapshot.connectionState == ConnectionState.waiting) {
      // //     return Text("Loading");
      // //   }
      //
      // //   else{
      //
      //
      //
      // //   }
      //
      // //   return
      // //   ListView(
      // //     children: snapshot.data!.docs.map((DocumentSnapshot document) {
      // //     Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
      // //       return
      // //       Padding(
      // //                 padding: const EdgeInsets.all(16.0),
      // //                 child: Container(
      // //                   height: 90,
      // //                   width: MediaQuery.of(context).size.width,
      // //                   color: Colors.blueGrey[50],
      // //                   child: Column(
      // //                     mainAxisAlignment: MainAxisAlignment.center,
      // //                     crossAxisAlignment: CrossAxisAlignment.center,
      // //                     children: [
      // //                       Text(_usersStream.length.),
      // //                       SizedBox(
      // //                         height: 5,
      // //                       ),
      // //                       Text(data["institude"]),
      // //                       SizedBox(
      // //                         height: 5,
      // //                       ),
      // //                       Text(data["department"]),
      // //                       SizedBox(
      // //                         height: 5,
      // //                       ),
      // //                       Text(data["phone"]),
      // //                     ],
      // //                   ),
      // //                 ),
      // //               );
      // //     }
      //
      //
      // //   ).toList(),
      // //   );
      //
      //
      // //   },
      // // ),
      //
      //  Padding(
      //                 padding: const EdgeInsets.all(16.0),
      //                 child: Container(
      //                   height: 90,
      //                   width: MediaQuery.of(context).size.width,
      //                   color: Colors.blueGrey[50],
      //                   child: Column(
      //                     mainAxisAlignment: MainAxisAlignment.center,
      //                     crossAxisAlignment: CrossAxisAlignment.center,
      //                     children: [
      //                       Text("shahinur"),
      //                       SizedBox(
      //                         height: 5,
      //                       ),
      //                       Text("comilla university"),
      //                       SizedBox(
      //                         height: 5,
      //                       ),
      //                       Text("CSE"),
      //                       SizedBox(
      //                         height: 5,
      //                       ),
      //                       Text("01796033771"),
      //
      //                     ])
      //                 )
      //  ),
      //
      //                   Padding(
      //                     padding: const EdgeInsets.all(16.0),
      //                     child: Center(
      //                       child: Container(
      //                         alignment: Alignment.center,
      //                         height: 80,
      //                         width: MediaQuery.of(context).size.width,
      //                         color: Colors.blueGrey[50],
      //                         child: Column(
      //                           mainAxisAlignment: MainAxisAlignment.center,
      //                           crossAxisAlignment: CrossAxisAlignment.center,
      //                           children: [
      //                             // ignore: prefer_const_constructors
      //                             Text("YOUR TOKEN NAME"),
      //                             //Text("megna"),
      //                              Text(firebaseauth.currentUser!.uid),
      //                           ],
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.all(16.0),
      //                     child: Container(
      //                       height: 90,
      //                       width: MediaQuery.of(context).size.width,
      //                       color: Colors.blueGrey[50],
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         crossAxisAlignment: CrossAxisAlignment.center,
      //                         children: [
      //                           Text("Current Balance : 500 TAKA"),
      //                           SizedBox(
      //                             height: 5,
      //                           ),
      //                           Text("Morning Confirm mill : 1"),
      //                           SizedBox(
      //                             height: 5,
      //                           ),
      //                           Text("Lunch Confirm mill : 4"),
      //                           SizedBox(
      //                             height: 5,
      //                           ),
      //                           Text("Dinner Confirm mill : 7"),
      //                         ],
      //                       ),
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //     ]
      //         ),

    );


  }
}


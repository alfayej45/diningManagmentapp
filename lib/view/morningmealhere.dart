import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class MorningMealHere extends StatefulWidget {
  MorningMealHere({Key? key}) : super(key: key);

  @override
  State<MorningMealHere> createState() => _MorningMealHereState();
}

class _MorningMealHereState extends State<MorningMealHere> {
  String? imageUrl = "";
  String? name = "";
  int? updateprice;
  var box = Hive.box('user');


  FirebaseAuth auth=FirebaseAuth.instance;

  Future<void> morningConfirmMeal() async {
    var uid = DateTime.now().microsecondsSinceEpoch;
    final collucrion =
        FirebaseFirestore.instance.collection('morningMealConfirm');
    await collucrion.doc(uid.toString()).set({
      "conMealImage": imageUrl,
      "name": name,
      "username":box.get("name"),
      "uid":uid.toString()

    });

    imageUrl = "";
    name = "";
  }
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('Morning').snapshots();
  // final CollectionReference mealcolletion = FirebaseFirestore.instance.collection('Morning');
  final balanceupdate = FirebaseFirestore.instance.collection('user');


  MealUpdate(snapshot) async{
    print(snapshot["id"]);
    print(snapshot["mealPrice"]);
    final user = FirebaseFirestore.instance.collection("user").doc(auth.currentUser!.uid).get();
    user.then((value) => {
      updateprice = int.parse(value["currentBalance"].toString()) - int.parse(snapshot["mealPrice"]),
      print(updateprice),
      print(value["currentBalance"].toString()),
       balanceupdate.doc(value["uid"]).update({
        "currentBalance": updateprice!.toString(),
      })
    });}
  // UpdateMeal(snapshot) async {
  //   print(snapshot["token"]);
  //   final user = FirebaseFirestore.instance
  //       .collection('user')
  //       .doc(snapshot["token"])
  //       .get();
  //   user.then((value) => {
  //     print("c.balance" + value["currentBalance"]),
  //     print("balance" + snapshot["amount"]),
  //     setState(() {
  //       updateprice = int.parse(snapshot["amount"]) +
  //           int.parse(value["currentBalance"]);
  //       print(updateprice);
  //       balanceupdate.doc(snapshot["token"]).update({
  //         "currentBalance": updateprice!.toString(),
  //       });
  //
  //       FirebaseFirestore.instance
  //           .collection('BalanceLoad')
  //           .doc(snapshot["id"])
  //           .delete();
  //     })
  //   });
  // }

  // UpdateMeal( snapshot)async{
  //   setState(() {
  //     updateprice= int.parse(snapshot["stockNumber"]) - int.parse(snapshot["mealPrice"]);
  //   });
  //   mealcolletion.doc(snapshot["id"])
  //       .update({
  //      "downloadURL":snapshot["downloadURL"],
  //     "mealPrice":snapshot["mealPrice"],
  //     "mealname":snapshot["mealname"],
  //     "stockNumber":updateprice!.toString(),
  //   });
  //
  //
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Meal Here"),
        // ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("Loading...."),
                );
              } else if (snapshot.hasError) {
                return Text('Something went wrong');
              } else if (snapshot.connectionState == ConnectionState.done) {
                return Text("Loading");
              } else
                return GridView.builder(
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return Container(
                        height: 100,
                        width: 100,
                        //width: MediaQuery.of(context).size.width,
                        color: Colors.grey,
                        child: Column(
                          children: [
                            SizedBox(height: 10),
                            Container(
                                height: 80,
                                width: MediaQuery.of(context).size.width,
                                child: Image.network(data['downloadURL'])),
                            SizedBox(height: 5),
                            Text(data['mealname']),
                            SizedBox(height: 5),
                            Text("Price : ${data['mealPrice']}"),
                            SizedBox(height: 5),
                            Text("Stock : ${data['stockNumber']}"),
                            SizedBox(height: 5),
                            InkWell(
                              onTap: () {
                                imageUrl = data['downloadURL'];
                                name = data['mealname'];

                                confirmShowAlertDialog(data);
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 20,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text("Confirm Now",
                                      style: TextStyle(color: Colors.red))),
                            )
                          ],
                        ),
                      );
                    });
            }));
  }

  confirmShowAlertDialog(data) {
    AlertDialog alert = AlertDialog(
        title: Column(
          children: [
            Text("Are you sure Confirm this meal"),
          ],
        ),
        actions: [
          Row(
            children: [
              TextButton(
                child: Text("No",
                    style: TextStyle(color: Colors.red, fontSize: 20)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Yes", style: TextStyle(color: Colors.blue)),
                onPressed: () {
                  morningConfirmMeal();
                  MealUpdate(data);
                  Navigator.of(context).pop();
                },
              ),
            ],
          )
        ]);

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}

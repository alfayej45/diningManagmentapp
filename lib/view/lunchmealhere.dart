import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LunchMealHere extends StatefulWidget {
  LunchMealHere({Key? key}) : super(key: key);

  @override
  State<LunchMealHere> createState() => _LunchMealHereState();
}

class _LunchMealHereState extends State<LunchMealHere> {
  String? imageUrl = "";
  String? name = "";
  int? updateprice;
  FirebaseAuth auth = FirebaseAuth.instance;
  var box=Hive.box("user");

  Future<void> lunchConfirmMeal() async {

    var uid = DateTime.now().microsecondsSinceEpoch;
    final collucrion =
        FirebaseFirestore.instance.collection('LunchMealConfirm');
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
      FirebaseFirestore.instance.collection('Lunch').snapshots();

  final balanceupdate = FirebaseFirestore.instance.collection('user');

  MealUpdate(snapshot) async {
    print(snapshot["id"]);
    print(snapshot["mealPrice"]);
    final user = FirebaseFirestore.instance
        .collection("user")
        .doc(auth.currentUser!.uid)
        .get();
    user.then((value) => {
          updateprice = int.parse(value["currentBalance"].toString()) -
              int.parse(snapshot["mealPrice"]),
          print(updateprice),
          print(value["currentBalance"].toString()),
          balanceupdate.doc(value["uid"]).update({
            "currentBalance": updateprice!.toString(),
          })
        });
  }

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
                  lunchConfirmMeal();
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

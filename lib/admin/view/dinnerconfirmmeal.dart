import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DinnerConfirmMeal extends StatefulWidget {
  DinnerConfirmMeal({Key? key}) : super(key: key);

  @override
  State<DinnerConfirmMeal> createState() => _DinnerConfirmMealState();
}

class _DinnerConfirmMealState extends State<DinnerConfirmMeal> {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('DinnerMealConfirm').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Meal Here"),
      // ),

      body:StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot, ) {
          if(!snapshot.hasData){
            return Center(
              child: Text("Loading...."),
            );

          }
         else if (snapshot.hasError) {
            return Text('Something went wrong');
          }
     
          if (snapshot.connectionState == ConnectionState.done) {
            return Text("Loading");
          }
     
          return Container(
        
        // height: 300,
        // width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: snapshot.data!.docs.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
          ), 
          itemBuilder: (BuildContext context, int index){
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
                             child: Image.network(data['conMealImage'])),
                             SizedBox(height: 5),
                           Text(data['name']),
                           SizedBox(height: 5),
                           Text("Total confirm : 20"),
                           SizedBox(height: 5),
                          //  Text("Price : 200"),
                          //  SizedBox(height: 5),
                        


                         ],
                ),
            );
          }
          ),

      );
        }
      )
    );
  }

}
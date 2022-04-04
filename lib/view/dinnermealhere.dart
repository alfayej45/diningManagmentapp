import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DinnerMealHere extends StatefulWidget {
  DinnerMealHere({Key? key}) : super(key: key);

  @override
  State<DinnerMealHere> createState() => _DinnerMealHereState();
}

class _DinnerMealHereState extends State<DinnerMealHere> {

  String? imageUrl =""; 
  String ? name ="";

   Future<void> dinnerConfirmMeal() async {
    final collucrion = FirebaseFirestore.instance.collection('DinnerMealConfirm');
    await collucrion.add({
      "conMealImage": imageUrl,
      "name": name,
    
      
    });

   imageUrl= ""; 
    name = "";
    
    
  }

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Dinner').snapshots();


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
     
          else if (snapshot.connectionState == ConnectionState.done) {
            return Text("Loading");
          }
     
         else return  GridView.builder(
          itemCount:snapshot.data!.docs.length,
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
                             child: Image.network(data['downloadURL'])),
                             SizedBox(height: 5),
                           Text(data['mealname']),
                           SizedBox(height: 5),
                           Text("Price : ${data['mealPrice']}"),
                           SizedBox(height: 5),
                           
                           Text("Stock : ${data['stockNumber']}"),
                           SizedBox(height: 5),
                            InkWell(
                              onTap:(){
                                 imageUrl = data['downloadURL'];
                                name = data['mealname'];
                                confirmShowAlertDialog(context);
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 20,
                                width: 100,
                                decoration: BoxDecoration(
                                  color : Colors.blue,
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: Text("Confirm Now" , style: TextStyle(color: Colors.red))
                              ),
                            )


                         ],
                ),
            );
          
        

      
        }
      );
      
        }
      )
    );
  }
   
confirmShowAlertDialog(BuildContext context){

 AlertDialog alert = AlertDialog(
   title: Column(
     children: [
       Text("Are you sure Confirm this meal"),
      

      
     ],
   ),
   
  actions:[

     Row(
       children: [
         TextButton(
          child:  Text("No", style: TextStyle(color: Colors.red, fontSize: 20)),
          onPressed: (){
           Navigator.of(context).pop();
          
          },
    ),
    
     TextButton(
          child:  Text("Yes", style: TextStyle(color: Colors.blue)),
          onPressed: (){
            dinnerConfirmMeal();
              Navigator.of(context).pop();
          
          },
    ),


       ],
     )

  ]
 );

 showDialog(
   context: context,
    builder: (BuildContext context){
      return alert;

    }
    );
  

}
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MorningMealPost extends StatefulWidget {
  MorningMealPost({Key? key}) : super(key: key);

  @override
  State<MorningMealPost> createState() => _MorningMealPostState();
}

class _MorningMealPostState extends State<MorningMealPost> {
  final TextEditingController mealName =  TextEditingController();
  final TextEditingController mealPrice =  TextEditingController();
  final TextEditingController stockNumber =  TextEditingController();

  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Morning').snapshots();






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
                             height: 70,
                             width: MediaQuery.of(context).size.width, 
                             child: Image.network(data['downloadURL'])),
                             SizedBox(height: 5),
                           Text(data['mealname']),
                           SizedBox(height: 5),
                           Text("Price : ${data['mealPrice']}"),
                           SizedBox(height: 5),
                           
                           Text("Stock : ${data['stockNumber']}"),
                           SizedBox(height: 5),
                           Padding(
                             padding: const EdgeInsets.only(left: 40),
                             child: Row(children: [
                               InkWell(
                                onTap:(){

                                  mealName.text = data['mealname'];
                                  mealPrice.text = data['mealPrice'];
                                  stockNumber.text = data['stockNumber'];

                                AlertDialog alert = AlertDialog(
   title: Column(
     children: [
       Text("Edit this meal"),
        Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 20,
                  right: 20
                ),
                child: TextFormField(
                  controller: mealName,
                  
                  decoration: InputDecoration(
                    labelText: "Meal Name",
                    hintText: "Enter Name",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 20,
                  right: 20
                ),
                child: TextFormField(
                  controller: mealPrice,
                
                  decoration: InputDecoration(
                    labelText: "Meal Price",
                    hintText: "Enter Price",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 20,
                  right: 20
                ),
                child: TextFormField(
                  controller: stockNumber,
                  
                  decoration: InputDecoration(
                    labelText: "Stock",
                    hintText: "Enter number",
                    border: OutlineInputBorder()
                  ),
                ),
              ),
      

      
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
          child:  Text("Save", style: TextStyle(color: Colors.blue)),
          onPressed: (){



             snapshot.data!.docs[index].reference.update({
                "mealname": mealName.text,
                "mealPrice": mealPrice.text,
                "stockNumber": stockNumber.text,

             });
            
             Navigator.pop(context);
            
          
          },
    ),


       ],
     )

  ]
 );

 showDialog(
   context: context,
    builder: (context)=>alert

    
 );
    
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 20,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color : Colors.blue,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text("Edit" , style: TextStyle(color: Colors.white))
                                ),
                              ),
                              SizedBox(width: 10),
                               InkWell(
                                onTap:(){
                                  

 AlertDialog alert = AlertDialog(
   title: Column(
     children: [
       Text("Are you sure Delete this meal"),
      

      
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
             snapshot.data!.docs[index].reference.delete();
             Navigator.pop(context);
            
          
          },
    ),


       ],
     )

  ]
 );

 showDialog(
   context: context,
    builder: (context)=>alert

    
 );
    
  


                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 20,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    color : Colors.red,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                  child: Text("Delete" , style: TextStyle(color: Colors.white))
                                ),
                              )
                             ],),
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
   

}
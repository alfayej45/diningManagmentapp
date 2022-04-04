import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BalanceLoadUserRequest extends StatefulWidget {
  const BalanceLoadUserRequest({ Key? key }) : super(key: key);

  @override
  _BalanceLoadUserRequestState createState() => _BalanceLoadUserRequestState();
}

class _BalanceLoadUserRequestState extends State<BalanceLoadUserRequest>
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

    
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('Balance Load').snapshots();

  int ? amount = 500;

  @override
  Widget build(BuildContext context) {


     return Scaffold(
       appBar:AppBar(
         title: Text("Total request")
       ),
       body: StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot, ) {
            if(!snapshot.hasData){
            return Center(
              child: Text("Loading...."),
            );

          }
        else  if (snapshot.hasError) {
            return Text('Something went wrong');
          }
     
          if (snapshot.connectionState == ConnectionState.done) {
            return Text("Loading");
          }
     
          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
           
           
              return Card(
                elevation:5,
                child: Container(
                  alignment: Alignment.center,
                  height:150,
                  width: MediaQuery.of(context).size.width,
                  //color: (data.length %2 == 0)? Colors.white : Colors.grey,
                  color: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(data['name'], style: TextStyle(color: Colors.white)),
                      Text(data['token'], style: TextStyle(color: Colors.white)),
                      Text("Total Amount : ${data['amount']}", style: TextStyle(color: Colors.white)),
                       SizedBox(height:10),
                        Padding(
                          padding: const EdgeInsets.only(left: 80, top:10),
                          child: Row(children: [

                              InkWell(
                                onTap: (){
                                  

                                  cancelshowAlertDialog(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 25,
                                  width: 80,
                                   decoration: BoxDecoration(
                                                   color: Colors.red,
                                                   borderRadius: BorderRadius.circular(9)
                                                ),
                                  
                                  
                                     child: Text("Cancel", style: TextStyle(color: Colors.white))
                                     
                                ),
                              ),
                                 SizedBox(width: 40),
                                  InkWell(
                                onTap: (){
                                  acceptshowAlertDialog(context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 25,
                                  width: 80,
                                   decoration: BoxDecoration(
                                                   color: Colors.green,
                                                   borderRadius: BorderRadius.circular(9)
                                                ),
                                  
                                  
                                     child: Text("Accept", style: TextStyle(color: Colors.white))
                                     
                                ),
                              ),
                    ],
                  ),
                        ),
                  

                    ]
                  )
                ),
              );
            }).toList(),
          );
        },
         ),
     );









    // return Scaffold(


    //    body:CustomScrollView(
    //     slivers:[
    //       SliverAppBar(
    //         expandedHeight: 180,
    //         backgroundColor: Colors.deepOrange,
    //         title: Text("Today's Request"),
    //         centerTitle: true,
    //         actions: [
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: CircleAvatar(
    //               radius: 15,
    //               backgroundImage: NetworkImage("https://im.rediff.com/money/2014/sep/19sundar4.jpg"),
    //             ),
    //           )
    //         ],
    //         flexibleSpace: FlexibleSpaceBar(
    //           title: Padding(
    //             padding: const EdgeInsets.only(right: 10, top: 6),
    //             child: SingleChildScrollView(
    //               child: Column(
    //                 mainAxisAlignment:MainAxisAlignment.center,
    //                 crossAxisAlignment:CrossAxisAlignment.center,
    //                 children: [
    //                   SizedBox(height: 100),
    //                   Padding(
    //                     padding: const EdgeInsets.only(right: 30),
    //                     child: Text("Total Request:100", style: TextStyle(fontSize: 15),),
    //                   ),
    //                   SizedBox(height: 15,),
    //                   Row(
    //                     children: [
    //                       SizedBox(
    //                         height: 30,
    //                         width: 120,
    //                         child: TextFormField(
    //                           decoration: InputDecoration(
    //                             border: OutlineInputBorder(),
    //                             labelText: "Search",
    //                             filled : true,
    //                             fillColor: Colors.white,
    //                             hintText: "Search user"
                
    //                           ),
    //                         ),
    //                       ),
    //                       Container(
    //                         height: 30 ,
    //                         width: 30,
    //                         color: Colors.blueGrey,
    //                         child: Icon(Icons.search, color: Colors.white),
                
    //                       )
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
            
          

    //       ),
    //       SliverList(
    //         delegate:SliverChildBuilderDelegate(
    //           (context, index) =>
    //           Container(
    //             color: (index % 2 == 0)? Colors.white : Colors.grey,
    //             height: 100,
    //             width: MediaQuery.of(context).size.width,
    //             child: Row(
    //               children: [
    //                 SizedBox(width: 50,),
    //                 CircleAvatar(
    //                   radius: 20,
    //                   backgroundImage: NetworkImage("https://im.rediff.com/money/2014/sep/19sundar4.jpg"),
                      
    //                 ),
    //                 SizedBox(width: 10,),
    //                 VerticalDivider(
    //                   width: 20,
    //                   thickness : 3,
    //                   color: Colors.orange,
    //                   endIndent: 10,
    //                   indent: 10,

    //                 ),
    //                 SizedBox(width: 25,),

    //                 Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [

    //                     Text("SHAHINUR"),
    //                     Text("Total Amount=$amount"),



                        




    //                     SizedBox(height:10),
    //                     Row(children: [

    //                         InkWell(
    //                           onTap: (){
    //                             cancelshowAlertDialog(context);
    //                           },
    //                           child: Container(
    //                             alignment: Alignment.center,
    //                             height: 25,
    //                             width: 80,
    //                              decoration: BoxDecoration(
    //                                              color: Colors.red,
    //                                              borderRadius: BorderRadius.circular(9)
    //                                           ),
                                
                                
    //                                child: Text("Cancel")
                                   
    //                           ),
    //                         ),
    //                            SizedBox(width: 10),

    //                               InkWell(
    //                                 onTap: (){
    //                                   acceptshowAlertDialog(context);
    //                                 },
    //                                 child: Container(
    //                                                             alignment: Alignment.center,
    //                                                             height: 25,
    //                                                             width: 80,
    //                                                              decoration: BoxDecoration(
    //                                                    color: Colors.blue,
    //                                                    borderRadius: BorderRadius.circular(9)
    //                                                 ),
                                                                
                                                                
    //                                                                child: Text("Accept")
                                                                   
    //                                                           ),
    //                               ),



    //                     ],)



            



    // //                      StreamBuilder<QuerySnapshot>(
    // //   stream: _usersStream,
    // //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    // //     if (snapshot.hasError) {
    // //       return Text('Something went wrong');
    // //     }

    // //     if (snapshot.connectionState == ConnectionState.waiting) {
    // //       return Text("Loading");
    // //     }

    // //     return ListView(
    // //       shrinkWrap: true,
    // //       primary: false,
    // //       children: snapshot.data!.docs.map((DocumentSnapshot document) {
    // //       Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    // //         return Column(children: [

    // //           Text(data["name"]),
    // //           Text("Total Amount = ${data[amount]}"),


    // //                      SizedBox(height:10),
    // //                     Row(children: [

    // //                         InkWell(
    // //                           onTap: (){
    // //                             cancelshowAlertDialog(context);
    // //                           },
    // //                           child: Container(
    // //                             alignment: Alignment.center,
    // //                             height: 25,
    // //                             width: 80,
    // //                              decoration: BoxDecoration(
    // //                                              color: Colors.red,
    // //                                              borderRadius: BorderRadius.circular(9)
    // //                                           ),
                                
                                
    // //                                child: Text("Cancel")
                                   
    // //                           ),
    // //                         ),
    // //                            SizedBox(width: 10),

    // //                               InkWell(
    // //                                 onTap: (){
    // //                                   acceptshowAlertDialog(context);
    // //                                 },
    // //                                 child: Container(
    // //                                                             alignment: Alignment.center,
    // //                                                             height: 25,
    // //                                                             width: 80,
    // //                                                              decoration: BoxDecoration(
    // //                                                    color: Colors.blue,
    // //                                                    borderRadius: BorderRadius.circular(9)
    // //                                                 ),
                                                                
                                                                
    // //                                                                child: Text("Accept")
                                                                   
    // //                                                           ),
    // //                               ),



    // //                     ],)



    // //         ],);


    // //         //  ListTile(
    // //         //   title: Text(data['full_name']),
    // //         //   subtitle: Text(data['company']),
    // //         // );
    // //       }).toList(),
    // //     );
    // //   },
    // // )



                        
                       
    //                   ],
    //                 ),

                    
                  
    //               ],
    //             ),
    //           ),
    //           //childCount: 51

    //         )
    //          )

    //     ]
    //   )


      
     
    // );
  }





cancelshowAlertDialog(BuildContext context){

 AlertDialog alert = AlertDialog(
   title: Column(
     children: [
       Text("Do you Cancel this request"),
       Text("You can click cancel button")

      
     ],
   ),
   
  actions:[

     Row(
       children: [
         TextButton(
          child:  Text("No", style: TextStyle(color: Colors.blue, fontSize: 20)),
          onPressed: (){
            Navigator.of(context).pop();
          
          },
    ),
    
     TextButton(
          child:  Text("Cancel", style: TextStyle(color: Colors.red, fontSize: 20)),
          onPressed: ()async{
 final docUser = FirebaseFirestore.instance.collection('Balance Load').doc('ldz4y8X4MvzoUXhmmxi8');
           
                                  docUser.delete();
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





acceptshowAlertDialog(BuildContext context){

 AlertDialog alert = AlertDialog(
   title: Column(
     children: [
       Text("Do you Accept this request"),
       Text("You can click Accept button")

      
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
          child:  Text("Accept", style: TextStyle(color: Colors.blue)),
          onPressed: (){
          
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
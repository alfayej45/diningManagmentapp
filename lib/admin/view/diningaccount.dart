import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:time/time.dart';

class DiningAccount extends StatefulWidget {
  const DiningAccount({ Key? key }) : super(key: key);

  @override
  _DiningAccountState createState() => _DiningAccountState();
}

class _DiningAccountState extends State<DiningAccount>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
    
    DateTime _dateTime = DateTime.now();
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
final Duration tenMinutes = 1.minutes;



  int ? total = 50000;
  int ? dailymeal = 100;
  int ? dailymealcost = 30 ;
 
 int currentbalance = 0;

 
 
  @override
  Widget build(BuildContext context) { 

    tenMinutes.compareTo(tenMinutes);
    

    print("dddd$tenMinutes");
    
    int ? cost = dailymeal!*dailymealcost! ;
      currentbalance =  total!- cost;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black12,
        child: SingleChildScrollView(
          child: Column(
            children: [
    Text("${DateFormat().format(_dateTime)}"),


              Padding(
                padding: const EdgeInsets.only(
                  top: 70,
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/diningaccount.jpg"),
                  radius: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height/9.5,
                  width: MediaQuery.of(context).size.width/1.3,
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text(
                    "Total Balance : $total taka",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height/9.5,
                  width: MediaQuery.of(context).size.width/1.3,
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text(
                    "Today's Meal : $dailymeal",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height/9.5,
                  width: MediaQuery.of(context).size.width/1.3,
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text(
                    "Today's Meal Cost : $dailymealcost taka",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height/9.5,
                  width: MediaQuery.of(context).size.width/1.3,
                  decoration: BoxDecoration(
                    color: Colors.blue[600],
                    borderRadius: BorderRadius.circular(5)
                  ),
                  child: Text(
                    "Current Balance : $currentbalance taka",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
// its was update total balance button 


              // Padding(
              // padding: const EdgeInsets.only(
              //   top: 20,
              // ),
              // child: Container(
              //     alignment: Alignment.center,
              //     height: 50,
              //     width: MediaQuery.of(context).size.width/1.3,
              //     decoration: BoxDecoration(
              //        color: Colors.blue[900],
              //        borderRadius: BorderRadius.circular(9)
              //     ),
              //     child: Text(
              //       "Update Total Balane",
              //       style: TextStyle(
              //         color: Colors.white,
              //         fontSize: 25,
              //         fontWeight: FontWeight.bold
              //       ),
              //     ),
              //   )
              // )
            ]
          ),
        )
      ),
    );
  }
}
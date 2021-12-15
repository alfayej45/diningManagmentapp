import 'package:flutter/material.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({ Key? key }) : super(key: key);

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount>
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.green,
              radius: 100,
              child: Text("SHAHINUR"),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: Colors.blueGrey[50],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("SHAHINUR ISLAM"),
                    SizedBox(height: 5,),
                    Text("Comilla University"),
                     SizedBox(height: 5,),
                    Text("CSE"),
                     SizedBox(height: 5,),
                    Text("01796033771"),

                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                
                height: 150,
                width: MediaQuery.of(context).size.width,
                color: Colors.blueGrey[50],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    Text("Current Balance : 500 TAKA"),
                     SizedBox(height: 5,),
                    Text("Morning Confirm mill : 1"),
                     SizedBox(height: 5,),
                      Text("Lunch Confirm mill : 4"),
                     SizedBox(height: 5,),
                      Text("Dinner Confirm mill : 7"),
                   

                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}


import 'package:diningmanagement/view/user_profile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

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
              alignment: Alignment.center,
              color: Colors.green,
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                          Container(
              alignment: Alignment.bottomCenter,
              color: Colors.green,
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Text("Dining", style: TextStyle(color: Colors.red, fontSize: 50)),

            ),
                    Container(
              alignment: Alignment.topCenter,
              color: Colors.green,
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Text("Management", style: TextStyle(color: Colors.red, fontSize: 50)),

            ),
         
                ],
              ),

            ),

               ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
               InkWell(
                 onTap: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> MyAccount()));
                 },
                 child: ListTile(
                             leading: Icon(Icons.people),
                             title: Text("My Account"),
                             trailing: Icon(Icons.arrow_forward_ios),
                           ),
               ),
               ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
               ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
               ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              trailing: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
      ),
      appBar: AppBar(
        title: Text("Dining"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Dining Management"),
      ),
    );
  }
}
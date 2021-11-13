import 'package:diningmanagement/view/register.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>
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
  final _globalkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _globalkey,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:  ListView(
              children: [
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: [
                  Container(
                    height: 150,
                    width: 250,
                    child: Image.asset("assets/images/dining.jpg")),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                      alignment:Alignment.topLeft,
                      child: Text("Login" , style: TextStyle(color:Colors.green, fontSize: 25, fontWeight: FontWeight.bold))),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Container(
                      alignment:Alignment.topLeft,
                      child: Text("Please sign in to continue" , style: TextStyle(color:Colors.blueGrey))),
                  ),
                    
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        hintText: "Enter your email",
                      )
                    ),
                  ),
                    Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Password",
                        hintText: "Enter your Password",
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please enter your password";
                          
                        }
                        return null;
                      },
                    ),
                  ),
                    
                InkWell(
                  onTap: (){
                    
                  },
                    child: Container(
                      alignment:Alignment.center,
                      height: 50,
                      width: 200,
                      
                      
                      decoration:BoxDecoration(
                        color: Colors.blueGrey,
                       
                       borderRadius: BorderRadius.circular(25)
                      ),
                      child: Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
                    },
                    child: RichText(text: TextSpan(
                      style: TextStyle(color: Colors.blueGrey),
                      children: [
                        TextSpan(
                          text: "Don't have an account", 
                          
                        ),
                        TextSpan(
                          text: "?", style: TextStyle(color: Colors.red)
                        ),
                        TextSpan(
                          text: "Register", style: TextStyle(color: Colors.lightGreen)
                        )
                  
                      ]
                    )
                    ),
                  )
                
                
                ],
              ),
              ],
            ),
            ),
        ),
      ),
    );
  }
}
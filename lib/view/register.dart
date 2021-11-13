import 'package:diningmanagement/view/login.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({ Key? key }) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register>
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

  final _globalkey2 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key:_globalkey2,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                 Column(
                mainAxisAlignment:MainAxisAlignment.center,
                crossAxisAlignment:CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 80,
                  child: CircleAvatar(
                    backgroundColor: Colors.greenAccent[100],
                    radius: 75,
                    child: CircleAvatar(
                      backgroundImage:AssetImage("assets/images/avater.jpg"),
                      radius: 70,
                    ), //CircleAvatar
                  ), //CircleAvatar
                ),
                  Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Name",
                              hintText: "Enter your full name",
                            ),
                                   validator: (value){
                        if(value!.isEmpty){
                          return "Please enter your full name";
                          
                        }else if(value.length<=3){
                          return "Must be 3 character";

                        }
                        return null;
                      },
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Institute",
                              hintText: "Enter your institute name",
                            ),
                                   validator: (value){
                        if(value!.isEmpty){
                          return "Please enter your institute name";
                          
                        }
                        return null;
                      },
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Department",
                              hintText: "Enter your Department name",
                            ),
                                   validator: (value){
                        if(value!.isEmpty){
                          return "Please enter your department name";
                          
                        }
                        return null;
                      },
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Phone",
                              hintText: "Enter your phone number",
                            ),
                                   validator: (value){
                        if(value!.isEmpty){
                          return "Please enter your phone number";
                          
                        }
                        return null;
                      },
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Photo",
                              hintText: "Choose your photo",
                            )
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email",
                              hintText: "Enter your email",
                            ),
                                   validator: (value){
                        if(value!.isEmpty){
                          return "Please enter your email";
                          
                        }
                        return null;
                      },
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              hintText: "Enter your password",
                            ),
                              validator: (value){
                        if(value!.isEmpty){
                          return "Please enter your password";
                          
                        }
                        return null;
                      },
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 40),
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Confirm password",
                              hintText: "Enter confirm password",
                            )
                          ),
                        ),
                          InkWell(
                  onTap: (){
                     if (_globalkey2.currentState!.validate()) {
                       print("all successful");
                         ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
               
             }
                    
                  },
                    child: Container(
                      alignment:Alignment.center,
                      height: 50,
                      width: 200,
                      
                      
                      decoration:BoxDecoration(
                        color: Colors.blueGrey,
                       
                       borderRadius: BorderRadius.circular(25)
                      ),
                      child: Text("Register", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25)),
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 50),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                      },
                      child: RichText(text: TextSpan(
                        style: TextStyle(color: Colors.blueGrey),
                        children: [
                          TextSpan(
                            text: "Already have an account", 
                            
                          ),
                          TextSpan(
                            text: "?", style: TextStyle(color: Colors.red)
                          ),
                          TextSpan(
                            text: "Login", style: TextStyle(color: Colors.lightGreen)
                          )
                    
                        ]
                      )
                      ),
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
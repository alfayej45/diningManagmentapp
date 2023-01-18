import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diningmanagement/view/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  String? userId;
  //const Register({ Key? key }) : super(key: key);

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
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  TextEditingController email = TextEditingController();

  registration() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: email.text, password: password.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  File? _image;
  final imagePicker = ImagePicker();
  String? downloadURL;

  // picking the image

  Future imagePickerMethodGallery() async {
    final pick = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar("No File selected", Duration(milliseconds: 400));
      }
    });
  }

  Future imagePickerMethodCamera() async {
    final pick = await imagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pick != null) {
        _image = File(pick.path);
      } else {
        showSnackBar("No File selected", Duration(milliseconds: 400));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _globalkey2,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 80,
                      child: CircleAvatar(
                        backgroundColor: Colors.greenAccent[100],
                        radius: 75,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/managerreg.jpeg"),
                          radius: 70,
                        ), //CircleAvatar
                      ), //CircleAvatar
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 30),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Name",
                          hintText: "Enter your full name",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your full name";
                          } else if (value.length <= 3) {
                            return "Must be 3 character";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Institute",
                          hintText: "Enter your institute name",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your institute name";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Department",
                          hintText: "Enter your Department name",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your department name";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Phone",
                          hintText: "Enter your phone number",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your phone number";
                          } else if (value.length <= 10 || value.length >= 12) {
                            return "Please enter 11 digit";
                          }
                          return null;
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 40, top: 10),
                      child: Container(
                        //height: 70,
                        // width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 100,
                                color: Colors.red,
                                child: _image == null
                                    ? Text("No image",
                                        style: TextStyle(color: Colors.white))
                                    : Image.file(_image!)),
                            SizedBox(
                              width: 3,
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: ((builder) => bottomsheet()));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 50,
                                width: 177,
                                color: Colors.green,
                                child: Text("Choose photo",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // use this code for manager crteate dining database
                    // InkWell(
                    //   onTap: (){

                    //     showAlertDialog(context);

                    //   },
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                    //     child: Container(
                    //       alignment: Alignment.center,
                    //       color: Colors.grey,
                    //       height:60,
                    //       width:MediaQuery.of(context).size.width,
                    //       child: Text("Create/Edit Your Dining Database")

                    //     ),
                    //   ),
                    // ),

                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 10),
                      child: TextFormField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Email",
                          hintText: "Enter your email",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          } else if (!RegExp(
                                  "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please a valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 10),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Password",
                          hintText: "Enter your password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 40, right: 40, top: 10, bottom: 40),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        controller: confirmpassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Confirm password",
                          hintText: "Enter confirm password",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter re-password";
                          } else if (password.text != confirmpassword.text) {
                            return "your password don't match";
                          }
                        },
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (_globalkey2.currentState!.validate()) {
                          print("all successful");
                          registration();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(25)),
                        child: Text("Register",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25)),
                      ),
                    ),

                    SizedBox(
                      height: 40,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: RichText(
                            text: TextSpan(
                                style: TextStyle(color: Colors.blueGrey),
                                children: [
                              TextSpan(
                                text: "Already have an account",
                              ),
                              TextSpan(
                                  text: "?",
                                  style: TextStyle(color: Colors.red)),
                              TextSpan(
                                  text: "Login",
                                  style: TextStyle(color: Colors.lightGreen))
                            ])),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget bottomsheet() {
    return Container(
        height: 150,
        width: MediaQuery.of(context).size.width,
        // ignore: prefer_const_constructors
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Text(
              'Choose Profile photo',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton.icon(
                    onPressed: () {
                      imagePickerMethodCamera();
                    },
                    icon: Icon(Icons.camera),
                    label: Text('Camera')),
                SizedBox(
                  width: 50,
                ),
                TextButton.icon(
                    onPressed: () {
                      imagePickerMethodGallery();
                    },
                    icon: Icon(Icons.image),
                    label: Text('Gallery'))
              ],
            )
          ],
        ));
  }
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          Text(
            "MANAGER",
            style: TextStyle(letterSpacing: 8),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    CreatedatabaseAlertDialog(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Create DataBase",
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    EditdatabaseAlertDialog(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20)),
                    child: Text("Edit DataBase", style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        new TextButton(
          child: new Text("Cencel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ]);

     showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
CreatedatabaseAlertDialog(BuildContext context) {
  TextEditingController databasename = TextEditingController();

  Future _addValue() async {
    final collucrion = FirebaseFirestore.instance.collection(databasename.text);
    await collucrion.add({
      "name": databasename.text,
    });

    databasename.text = "";
  }

  AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          Text(
            "Create your Database",
            style: TextStyle(letterSpacing: 8),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: TextFormField(
              controller: databasename,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "DataBase",
                hintText: "Name",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your institute name";
                }
                return null;
              },
            ),
          ),
        ],
      ),
      actions: [
        new TextButton(
          child: new Text("save"),
          onPressed: () {
            _addValue();
            print(databasename.text);

            Navigator.of(context).pop();
          },
        )
      ]);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

EditdatabaseAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
      title: Column(
        children: [
          Text(
            "Edit your Database",
            style: TextStyle(letterSpacing: 8),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
            child: TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "DataBase",
                hintText: "Edit",
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your institute name";
                }
                return null;
              },
            ),
          ),
        ],
      ),
      actions: [
        new TextButton(
          child: new Text("save"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        )
      ]);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}

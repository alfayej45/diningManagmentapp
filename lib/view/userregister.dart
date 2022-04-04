

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:diningmanagement/view/login.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';

class UserRegister extends StatefulWidget {
   String? userId;
 // const UserRegister({ Key? key }) : super(key: key);

  @override
  _UserRegisterState createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister>
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
  TextEditingController password =  TextEditingController();
  TextEditingController confirmpassword =  TextEditingController();
  TextEditingController email =  TextEditingController();
  final TextEditingController name =  TextEditingController();
  final TextEditingController institude =  TextEditingController();
  final TextEditingController depeartment =  TextEditingController();
  final TextEditingController phone =  TextEditingController();


  Future<void> _addValue() async {
    final collucrion = FirebaseFirestore.instance.collection('public');
    await collucrion.add({
      "name": name.text,
      "institude": institude.text,
      "department": depeartment.text,
      "phone":phone.text,
    });

    name.text = ""; 
    institude.text = "";
    depeartment.text = "";
    phone.text = "";
  }




 registration()async{
  try {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email.text,
    password: password.text
  );
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

    File? _image ;
  final imagePicker= ImagePicker();
  String? downloadURL;

  //var selectedCurrency, selectedType;

    String _selectedindex = flowerItems.first;

  static final List<String> flowerItems = <String>[
    'Rose',
    'Lily',
    'Tulip',
    'Orchid',
    'Freesia'
  ];
  

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

   // uploading the image to firebase cloudstore
  Future uploadImage(File _image) async {

    FirebaseAuth firebaseauth = FirebaseAuth.instance;
    //final imgId = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('images');
        //.child("post_$imgId");

    await reference.putFile(_image);
    downloadURL = await reference.getDownloadURL();


    // cloud firestore
    await firebaseFirestore
        .collection("authuser")
        .doc(firebaseauth.currentUser!.uid)
        .collection("images")
        
        .add({
          'downloadURL': downloadURL,
          'username':"shahinur"
          }).whenComplete(
            () => showSnackBar("Image Uploaded", Duration(seconds: 2)));
  }





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
                  SizedBox(height: 20,),
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
                            keyboardType: TextInputType.text,
                            controller:name,
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
                            keyboardType: TextInputType.text,
                            controller:institude,
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
                            keyboardType: TextInputType.text,
                            controller: depeartment,
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
                            keyboardType: TextInputType.number,
                            controller:phone,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Phone",
                              hintText: "Enter your phone number",
                            ),
                                   validator: (value){
                        if(value!.isEmpty){
                          return "Please enter your phone number";
                          
                        }else if(value.length<=10 || value.length>=12){
                          return "Please enter 11 digit";

                        }
                        return null;
                      },
                          ),
                        ),
                       


                     



                         //imageProfile(),

                         Padding(
                           padding: const EdgeInsets.only(left: 40, top:10),
                           child: Container(
                             //height: 70,
                            // width: MediaQuery.of(context).size.width,
                             child: Row(
                               children: [
                                 Container(
                                   alignment: Alignment.center,
                                   height:50,
                                   width:100,
                                   color: Colors.red,
                                   child: _image == null
                                          ?  Text("No image", style:TextStyle(color: Colors.white))
                                          : Image.file(_image!)
                                   
                                 ),

                                SizedBox(width: 3,),
                                 InkWell(
                                    onTap: (){
                                       showModalBottomSheet(
                                    context: context, builder: ((builder) => bottomsheet()));
                                     

                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      height:50,
                                      width: 177,
                                      color: Colors.green,
                                      child: Text("Choose photo", style:TextStyle(color: Colors.white,fontSize: 20)),
                                     
                                                                 ),
                                  ),
                               ],
                             ),
                           ),
                         ),




// Database  name retrive problem here



// //     
//  StreamBuilder<QuerySnapshot>(
//   stream: FirebaseFirestore.instance.collection('dining-management').snapshots(),
//   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//     if (!snapshot.hasData) return new Text('Loading...');
//     return new ListView(
//       shrinkWrap: true,
//       primary:false,
//       children: snapshot.data!.docs.map((DocumentSnapshot document) {
//         return new ListTile(
//           title: new Text(document["dining-management"]),
          
//         );
//       }).toList(),
//     );
//   },
// ),

// Text("dropdown"),

 //basic dropdown use here
//  Padding(
//    padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
//    child: Container(
           
//             height: 50,
//             width:MediaQuery.of(context).size.width,
//             color: Colors.redAccent,
//             child: DropdownButtonHideUnderline(
//               child: DropdownButton(
                
//                 dropdownColor: Colors.blueGrey,
//                 value: _selectedindex,
//                 onChanged: (value) => setState(() {
//                   _selectedindex = value.toString();
//                 }),
//                 items: flowerItems
//                     .map((item) => DropdownMenuItem(
//                           child: Text(
//                             item,
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 20,
//                             ),
//                           ),
//                           value: item,
//                         ))
//                     .toList(),
//               ),
//             ),
//           ),
//  ),



//Its try coll retrive here 

// StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance.collection("dining").snapshots(),
//                   builder: (context,snapshot) {
//                     if (!snapshot.hasData)
//                        return Text("Loading.....");
//                     else {
//                       List<DropdownMenuItem> currencyItems = [];
//                       for (int i = 0; i < snapshot.data!.docs.length; i++) {
//                         DocumentSnapshot snap = snapshot.data!.docs[i];
                       
                        
                        
                        
//                         currencyItems.add(
//                           DropdownMenuItem(
//                             child: Text(
//                               snap.documentID,
//                               style: TextStyle(color: Color(0xff11b719)),
//                             ),
//                             value: "${snap.docsId}",
//                           ),
//                         );
//                       }
//                       return Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: <Widget>[
//                           Icon(FontAwesomeIcons.coins,
//                               size: 25.0, color: Color(0xff11b719)),
//                           SizedBox(width: 50.0),
//                           DropdownButton(
//                             items: currencyItems,
//                             onChanged: (currencyValue) {
//                               final snackBar = SnackBar(
//                                 content: Text(
//                                   'Selected Currency value is $currencyValue',
//                                   style: TextStyle(color: Color(0xff11b719)),
//                                 ),
//                               );
//                               Scaffold.of(context).showSnackBar(snackBar);
//                               setState(() {
//                                 selectedCurrency = currencyValue;
//                               });
//                             },
//                             value: selectedCurrency,
//                             isExpanded: false,
//                             hint: new Text(
//                               "Choose Currency Type",
//                               style: TextStyle(color: Color(0xff11b719)),
//                             ),
//                           ),
//                         ],
//                       );
//                     }
//                   }),


                

 













                          Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                          child: TextFormField(
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Email",
                              hintText: "Enter your email",
                            ),
                                   validator: (value){
                        if(value!.isEmpty){
                          return "Please enter your email";
                          
                        }else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Please a valid Email';
                      }
                        return null;
                      },
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40, top: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: password,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Password",
                              hintText: "Enter your password",
                            ),
                              validator: (value){
                        if(value!.isEmpty){
                          return "Please enter your password";
                          
                        }else if(value.length<=7){
                          return "minimum enter 7 character";
                        }
                        return null;
                      },
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40, top: 10, bottom: 40),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: confirmpassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Confirm password",
                              hintText: "Enter confirm password",
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return "Please enter re-password";
                              }else if(password.text != confirmpassword.text){
                                return "your password don't match";
                              }
                            },
                          ),
                        ),
                          InkWell(
                  onTap: (){
                    
                     if (_globalkey2.currentState!.validate()) {
                       print("all successful");
                       
                        print(name);
                        print(phone);
                        _addValue();
                       registration();
                         if (_image != null) {
                                        uploadImage(_image!);
                                      } else {
                                        showSnackBar("Select Image first",
                                            Duration(milliseconds: 400));
                                      }

                      


                      

                      

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
                        children: const [
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
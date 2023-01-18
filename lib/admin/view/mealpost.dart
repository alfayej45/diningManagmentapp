

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:random_string/random_string.dart';

class MealPostHere extends StatefulWidget {
  MealPostHere({Key? key}) : super(key: key);

  @override
  State<MealPostHere> createState() => _MealPostHereState();
}

class _MealPostHereState extends State<MealPostHere> {


   //String _selectedindex = flowerItems.first;

  // static final List<String> flowerItems = <String>[
  //   'Rose',
  //   'Lily',
  //   'Tulip',
  //   'Orchid',
  //   'Freesia'
  // ];



   File? _image ;
  final imagePicker= ImagePicker();
  String? downloadURL;



  final TextEditingController mealName =  TextEditingController();
  final TextEditingController mealPrice =  TextEditingController();
  final TextEditingController stockNumber =  TextEditingController();
  




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
     final imgId = DateTime.now().millisecondsSinceEpoch.toString();

    FirebaseAuth firebaseauth = FirebaseAuth.instance;
    //final imgId = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('meal')
        .child('images')
        .child("post_$imgId");

    await reference.putFile(_image);
    downloadURL = await reference.getDownloadURL();


    // cloud firestore
    await firebaseFirestore
        .collection("AllTime")
        // .doc()
        // .collection("images")
        
        .add({
          'downloadURL': downloadURL,
         "mealname": mealName.text,
      "mealPrice": mealPrice.text,
      "stockNumber": stockNumber.text,
          }).whenComplete(
            () => showSnackBar("Image Uploaded", Duration(seconds: 2)));
  }

   // uploading the image to firebase cloudstore
  Future uploadImageMorning(File _image) async {
     final imgId = DateTime.now().millisecondsSinceEpoch.toString();

    FirebaseAuth firebaseauth = FirebaseAuth.instance;
    //final imgId = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('meal')
        .child('images')
        .child("post_$imgId");

    await reference.putFile(_image);
    downloadURL = await reference.getDownloadURL();


    // cloud firestore
    // await firebaseFirestore
    //     .collection("Morning")
    //
        // .doc()
        // .collection("images")
     final collucrion = FirebaseFirestore.instance.collection('Morning');
     var docs = randomString(10);
       collucrion.doc(docs.toString()).set({
          'downloadURL': downloadURL,
         "mealname": mealName.text,
       "mealPrice": mealPrice.text,
       "stockNumber": stockNumber.text,
       "id":docs.toString(),
          }).whenComplete(
            () => showSnackBar("Image Uploaded", Duration(seconds: 2)));
  }

 // uploading the image to firebase cloudstore
  Future uploadImageLunch(File _image) async {
     final imgId = DateTime.now().millisecondsSinceEpoch.toString();

    FirebaseAuth firebaseauth = FirebaseAuth.instance;
    //final imgId = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('meal')
        .child('images')
        .child("post_$imgId");

    await reference.putFile(_image);
    downloadURL = await reference.getDownloadURL();


    // cloud firestore
    await firebaseFirestore
        .collection("Lunch")
        // .doc()
        // .collection("images")
        
        .add({
          'downloadURL': downloadURL,
         "mealname": mealName.text,
      "mealPrice": mealPrice.text,
      "stockNumber": stockNumber.text,
          }).whenComplete(
            () => showSnackBar("Image Uploaded", Duration(seconds: 2)));
  }

 // uploading the image to firebase cloudstore
  Future uploadImageDinner(File _image) async {
     final imgId = DateTime.now().millisecondsSinceEpoch.toString();

    FirebaseAuth firebaseauth = FirebaseAuth.instance;
    //final imgId = DateTime.now().millisecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference reference = FirebaseStorage.instance
        .ref()
        .child('meal')
        .child('images')
        .child("post_$imgId");

    await reference.putFile(_image);
    downloadURL = await reference.getDownloadURL();


    // cloud firestore
    await firebaseFirestore
        .collection("Dinner")
        // .doc()
        // .collection("images")
        
        .add({
          'downloadURL': downloadURL,
         "mealname": mealName.text,
      "mealPrice": mealPrice.text,
      "stockNumber": stockNumber.text,
          }).whenComplete(
            () => showSnackBar("Image Uploaded", Duration(seconds: 2)));
  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
      body: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              SizedBox(height: 45,),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20
                ),
                child: Stack(
                  children: [
                     CircleAvatar(
                    radius: 50,
                    //backgroundColor: Colors.blue,
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(100),
                         
       child: (_image != null)
         ? Image.file(_image!, 
          fit: BoxFit.fill,

                              height: 100,
                              width: 200,
                              scale: 1.0,
          
       )
        : Image.asset('assets/images/avater.jpg',
        fit: BoxFit.fill,

                              height: 100,
                              width: 200,
                              scale: 1.0,
        ),
                       )
    
                 //backgroundImage: 
                  ),

  //                CircleAvatar(
  //   backgroundColor: Colors.black,
  //   radius: 40.0,
  //   child: CircleAvatar(
  //     radius: 38.0,
  //     child: ClipOval(
  //       child: (_image != null)
  //       ? Image.file(_image!)
  //       : Image.asset('assets/images/avater.jpg'),
  //     ),
  //     backgroundColor: Colors.white,
  //   ),
  // ),


                  Positioned(
                    top: 50,
                    left: 70,
                    child: IconButton(
                      onPressed: (){
                         //bottomsheet();
                        //imagePickerMethodCamera();
                        // imagePickerMethodGallery();
                        imagePickerMethodGallery();
                      },
                       icon: Icon(Icons.camera_alt)
                       ),
                  )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 20,
                  right: 20
                ),
                child: TextFormField(
                  controller: mealName,
                  //controller: username,
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
                  //controller: token,
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
                  //controller: amount,
                  decoration: InputDecoration(
                    labelText: "Stock",
                    hintText: "Enter number",
                    border: OutlineInputBorder()
                  ),
                ),
              ),

              //Database table name show in droupdown menu of code
//               Padding(
//    padding: const EdgeInsets.only(
//      left: 20, right: 20, top: 5 ),
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
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 20,
                  right: 20,
                ),
                child: InkWell(
                  onTap: (){
                  showAlertDialog(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                       color: Colors.blue,
                       borderRadius: BorderRadius.circular(9)
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),
              )
            ],
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









showAlertDialog(BuildContext context){


    int? addValue(){
    int? a=5;
    int ? b = 5;
    int ? sum=0;
    sum =a+b;

    print(sum);


  }
  

 AlertDialog alert = AlertDialog(
   title: Column(
     children: [
       Text("Select your Shedule"),
       SizedBox(height: 20,),
       
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                           // _mealPostAllTime();

                           
                            uploadImage(_image!);
                           // print(uploadImage(_image!));
                            
                            addValue();
                            Navigator.pop(context);
                           // Navigator.push(context, MaterialPageRoute(builder: (context)=>Register()));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey,
                              borderRadius: BorderRadius.circular(20),
                              
                            ),
                            child: Text ("AllTime", style: TextStyle( color: Colors.white)),
                          ),
                        ),
                        SizedBox(height: 20,),
                         InkWell(
                            onTap: (){
                             uploadImageMorning(_image!);
                              
                              addValue();
                            Navigator.pop(context);
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>UserRegister()));
                          },
                           child: Container(
                             alignment: Alignment.center,
                                               height: 50,
                                               width: 100,
                                               decoration: BoxDecoration(
                                                 color: Colors.blue,
                                                 borderRadius: BorderRadius.circular(20)
                                               ),
                                               child: Text ("Morning" , style: TextStyle( color: Colors.white)),
                                             ),
                         ),
                         SizedBox(height: 20,),
                         InkWell(
                            onTap: (){
                              uploadImageLunch(_image!);
                              addValue();
                            Navigator.pop(context);
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>UserRegister()));
                          },
                           child: Container(
                             alignment: Alignment.center,
                                               height: 50,
                                               width: 100,
                                               decoration: BoxDecoration(
                                                 color: Colors.green,
                                                 borderRadius: BorderRadius.circular(20)
                                               ),
                                               child: Text ("Lunch" , style: TextStyle( color: Colors.white)),
                                             ),
                         ),
                         SizedBox(height: 20,),
                         InkWell(
                            onTap: (){
                             uploadImageDinner(_image!);
                              addValue();
                            Navigator.pop(context);
                            //Navigator.push(context, MaterialPageRoute(builder: (context)=>UserRegister()));
                          },
                           child: Container(
                             alignment: Alignment.center,
                                               height: 50,
                                               width: 100,
                                               decoration: BoxDecoration(
                                                 color: Colors.lightBlueAccent,
                                                 borderRadius: BorderRadius.circular(20)
                                               ),
                                               child: Text ("Dinner" , style: TextStyle( color: Colors.white)),
                                             ),
                         ),
                      ],
                    ),
                  ),
     ],
   ),
  actions:[

    new TextButton(
      child: new Text("Cencel"),
      onPressed: (){
        Navigator.of(context).pop();
      
      },
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

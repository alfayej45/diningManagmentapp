import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

class FireStoreDataBase {
  String? downloadURL;

  Future getData() async {
    try {
      await downloadURLExample();
      return downloadURL;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample() async {
   // final imgId = DateTime.now().millisecondsSinceEpoch.toString();
    downloadURL = await FirebaseStorage.instance
        .ref()
        .child('images')
        //.child("post_$imgId")
        .getDownloadURL();
    debugPrint(downloadURL.toString());
  }
}
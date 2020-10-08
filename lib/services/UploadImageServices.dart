import 'dart:io';

//==============================================
// IMAGE
//==============================================
import 'package:firebase_storage/firebase_storage.dart';


//==============================================
// CLASS
//==============================================
class UploadImageServices {

//==============================================
// FUNCTION (FUTURE)
//==============================================
static Future<String> writeFileToFireBaseStorage({File file}) async {
  StorageReference storageReference = FirebaseStorage.instance.ref().child('FOODMENUS').child('RESTAURANT_1');
  StorageUploadTask uploadTask = storageReference.putFile(file);
  await uploadTask.onComplete;
  return await storageReference.getDownloadURL();
  
  // .then((value) {
  //   print('UPLOAD FILE TO FIREBASE STORAGE COMPLETE ${value.toString()}');
  // }).catchError((error){
  //     print('UPLOAD FILE TO FIREBASE STORAGE ERROR $error');
  // });
}

}
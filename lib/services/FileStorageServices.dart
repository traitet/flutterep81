import 'dart:io';

//==============================================
// IMAGE
//==============================================
import 'package:firebase_storage/firebase_storage.dart';


//==============================================
// CLASS
//==============================================
class FileStorageServices {

//==============================================
// FUNCTION (FUTURE)
//==============================================
static Future writeFileToFireBaseStorage({File file}) async {
  StorageReference storageReference = FirebaseStorage.instance.ref().child('Test').child('test02');
  StorageUploadTask uploadTask = storageReference.putFile(file);
  await uploadTask.onComplete;
  await storageReference.getDownloadURL().then((value) {
    print('UPLOAD FILE TO FIREBASE STORAGE COMPLETE ${value.toString()}');
  }).catchError((error){
      print('UPLOAD FILE TO FIREBASE STORAGE ERROR $error');
  });
}

}
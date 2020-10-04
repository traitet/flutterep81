//============================================
// IMPORT FIREBASE AUTHEN
//============================================
import 'package:cloud_firestore/cloud_firestore.dart';

//============================================
// CLASS AUTHEN SERVICES
//============================================
class DatabaseServices {

//============================================
// WRITE DATA TO DB
//============================================
  static writeDataToDB() {
    return Firestore.instance.collection('TT_TESTS').document('D003').setData({'id': 2,'name': 'Mr.Smith'})
    .then((value) {
      print('WRITE DATA TO DB COMPLETED  !!!! ');
    })
    .catchError((error){
      print('WRITE DATA TO DB ERROR !!!! $error');      
    });
  }
  
//============================================
// READ DATA TO DB
//============================================
  static readDataFromDB() {
    return Firestore.instance.collection('TT_TESTS').document('D003').get()
    .then((value) {
      print('READ DATA FROM DB COMPLETED  !!!! ${value.data.toString()}');
    })
    .catchError((error){
      print('READ DATA FROM DB COMPLETED !!!! $error');      
    });
  }
  
}
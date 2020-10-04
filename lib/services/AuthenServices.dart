
//============================================
// IMPORT FIREBASE AUTHEN
//============================================
import 'package:firebase_auth/firebase_auth.dart';

//============================================
// CLASS AUTHEN SERVICES
//============================================
class AuthenServices {

//============================================
// REGISTER EMAIL
//============================================
  static registerEmailAccount() {
    return FirebaseAuth.instance.createUserWithEmailAndPassword(email: 'traitet@gmail.com', password: 'flutter')
    .then((value) {
      print('REGISTER EMAIL COMPLETED  !!!! ${value.user.email}');
    })
    .catchError((error){
      print('REGISTER EMAIL ERROR !!!! $error');      
    });
  }
  
//============================================
// SEND EMAIL RESET PASSWORD
//============================================  
  static sendEmailResetPassword() {
    return FirebaseAuth.instance.sendPasswordResetEmail(email: 'traitet@gmail.com')
    .then((value) {
      print('SEND EMAIL RESET PASSWORD COMPLETED  !!!! }');
    })
    .catchError((error){
      print('SEND EMAIL RESET PASSWORD ERROR !!!! $error');      
    });    
  }

//============================================
// LOGIN BY EMAIL
//============================================
  static loginByEmail() {
        return FirebaseAuth.instance.signInWithEmailAndPassword(email: 'traitet@gmail.com', password: 'flutter')
    .then((value) {
      print('LOGIN BY EMAIL COMPLETED  !!!! ${value.user.email}');
    })
    .catchError((error){
      print('LOGIN BY EMAIL ERROR  !!!! $error');      
    });    
  }
  
}
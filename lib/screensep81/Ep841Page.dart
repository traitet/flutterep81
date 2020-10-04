
//===================================================
// IMPORT
//===================================================
import 'package:flutter/material.dart';
import '../services/AuthenServices.dart';

class Ep841Page extends StatefulWidget {
  @override
  _Ep841PageState createState() => _Ep841PageState();
}

class _Ep841PageState extends State<Ep841Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP84-1 - Test Connection Firebase Cloud and Flutter for Authen services (login,register,sendmail reset password) ',style: TextStyle(fontSize: 14),maxLines: 2,),),
      body: ListView(children: <Widget>[
//===================================================
// BUTTONS
//===================================================        
            RaisedButton(onPressed: (){AuthenServices.registerEmailAccount();},child: Text('Register Email Account'),),     
            RaisedButton(onPressed: (){AuthenServices.sendEmailResetPassword();},child: Text('Send Mail Reset Password'),),     
            RaisedButton(onPressed: (){AuthenServices.loginByEmail();},child: Text('Login by Email'),),                                                                                                                         
      ],),
      
    );
  }
}
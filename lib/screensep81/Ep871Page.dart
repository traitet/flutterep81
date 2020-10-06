//===================================================
// IMPORT
//===================================================
import 'package:flutter/material.dart';
import '../models/MenuModel.dart';
import '../services/MenuServices.dart';

//===================================================
// CLASS
//===================================================
class Ep871Page extends StatefulWidget {
  @override
  _Ep871PageState createState() => _Ep871PageState();
}
//===================================================
// STATE CLASS
//===================================================
class _Ep871PageState extends State<Ep871Page> {
//===================================================
// DECLARE VARIABLE
//===================================================
MenuModel _menuModel;

//===================================================
// BUILD WIDGET
//===================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP87-1: Save and Search Food Menu to DB using model mapping ',style: TextStyle(fontSize: 14),maxLines: 2,),),
      body: ListView(children: <Widget>[
//===================================================
// BUTTONS#1.1) SAVE MENU
//===================================================             
            RaisedButton(onPressed: (){MenuServices.saveMenu(
              menuModel: MenuModel(
                menuId: 'M001',
                menuCategoryValue :'Food',
                menuNameEng :'Fred reice',
                menuNameThai :'Fred reice',
                menuDescriptionEng :'Fred reice',
                menuDescriptionThai :'Fred reice',
                rating :1,
                price : 100,
                spicyLevel :1 ,
                imageUrl : 'https://firebasestorage.googleapis.com/v0/b/flutterep81-cf49e.appspot.com/o/m001.jpg?alt=media&token=c7bbfb9e-56fe-4582-85b4-c10c42fafab3',                                
              )
            );},child: Text('Save Menu#1 to Firebase DB'),),    
//===================================================
// BUTTONS#1.2) SAVE MENU
//===================================================             
            RaisedButton(onPressed: (){MenuServices.saveMenu(
              menuModel: MenuModel(
                menuId: 'M003',
                menuCategoryValue :'Food',
                menuNameEng :'Green Curry',
                menuNameThai :'แกงเขียวหวานไก่',
                menuDescriptionEng :'Green Curry',
                menuDescriptionThai :'แกงเขียวหวานไก่',
                rating :5,
                price : 180,
                spicyLevel :3 ,
                imageUrl : 'https://firebasestorage.googleapis.com/v0/b/flutterep81-cf49e.appspot.com/o/m002.jpg?alt=media&token=0efa5403-cc26-4ca5-8739-e6fa4665cffe',                                
              )
            );},child: Text('Save Menu#2 to Firebase DB'),),              
//===================================================
// BUTTONS#2) GET MENUS BY CATEGORY
//===================================================             
            RaisedButton(onPressed: (){MenuServices.getMenusCategory(menuCategoryValue: 'Drinks');},child: Text('Get Menus by Category from Firebase DB'),),     
//===================================================
// BUTTONS#3.1) GET MENU BY MENU ID "M001"
//===================================================             
            RaisedButton(onPressed: (){
              setState(() {MenuServices.getMenu(menuId: 'M001').then((value){ _menuModel = value;}).catchError((error){});});
              
            },child: Text('Get menu#1 from Firebase DB'),),        
//===================================================
// BUTTONS#3.2) GET MENU BY MENU ID "M004"
//===================================================             
            RaisedButton(onPressed: (){
              setState(() {MenuServices.getMenu(menuId: 'M002').then((value){ _menuModel = value;}).catchError((error){});});              
            },child: Text('Get menu#2 from Firebase DB'),),                                      
//===================================================
// TEXT
//===================================================  
            _menuModel!=null?Text('Menu ID: ${_menuModel.menuId}'):Container(),     
            _menuModel!=null?Text('Menu NAME: ${_menuModel.menuNameEng}'):Container(),                                                                                                                                
      ],),
      
    );
  }
}
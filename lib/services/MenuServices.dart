//============================================
// IMPORT FIREBASE AUTHEN
//============================================
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/MenuModel.dart';

//============================================
// CLASS AUTHEN SERVICES
//============================================
class MenuServices {

//============================================
// WRITE DATA TO DB
//============================================
static Future saveMenu({MenuModel menuModel}) {
  return Firestore.instance.collection('TmMenu').document(menuModel.menuId).setData(menuModel.toFireStore()).then((value){
    print('SAVE MENU ${menuModel.menuId} COMPLETED');
  }).catchError((error){
    print('SAVE MENU ERROR $error');

  });
}

//============================================
// WRITE DATA TO DB
//============================================
static Stream<QuerySnapshot> getMenusCategory({String menuCategoryValue}){
  print('GET MENU BY CATEGORY $menuCategoryValue COMPLETED');
  return Firestore.instance.collection('TmMenu').where('menuCategoryValue',isEqualTo: menuCategoryValue).snapshots();
}

//============================================
// WRITE DATA TO DB
//============================================
static Future<MenuModel> getMenu({String menuId}){
return Firestore.instance.collection('TmMenu').document(menuId).get().then((value) {
//============================================
// PRINT OUTPUT FROM DB
//============================================    
    print('GET MENU $menuId COMPLETED ${value.data}');
//============================================
// RETURN MENU OBJECT
//============================================  
    return MenuModel.fromFireStore(value);
}).catchError((error){
    print('GET MENU ERROR $error');
});

}
  
  
}// END CLASS
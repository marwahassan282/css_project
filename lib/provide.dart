import 'package:flutter/cupertino.dart';

class AdminPanel extends ChangeNotifier{
 bool isAdmine=false;

 admin(bool isadmin){

   isAdmine=isadmin;
   notifyListeners();
 }

}
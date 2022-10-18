

import 'package:c_s_s/register/register-navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../base.dart';
import '../database/utils.dart';
import '../home/homescreen.dart';
import '../models/my-user.dart';

class RegisterViewModel extends BaseViewModel <RegisterNavigator>{
  String ? message;
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  CreateAccount(context,String email,String password,String fName,String lName,String userName) async{


    try {
      navigator.showloading('loading....',false);
      final credential =   await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      //navigator.hideloading();

      MyUser user=MyUser(id: firebaseAuth.currentUser?.uid??'', fName: fName, lName: lName, userName: userName, email: email);
      var result =DataBaseUtils.CreateDbUser(user);

      navigator.hideloading();
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomeScreen()));





    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        message='The password provided is too weak.';


      } else if (e.code == 'email-already-in-use') {
        message='The account already exists for that email.';


      }
      navigator.hideloading();
      if(message!=null){
        navigator.showmessage(message!);
      }
    } catch (e) {
      print(e);
    }}}

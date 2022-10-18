
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../base.dart';
import '../home/homescreen.dart';
import 'login-navigator.dart';

class LoginViewModel extends BaseViewModel <LoginNavigator>{

  var firebaseAuth=FirebaseAuth.instance;
  login(context,String email,String password) async{
    String ?  message=null;
    try {
      navigator.showloading('loading....',false);
      final credential =   await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);



    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        message='The password provided is too weak.';

      } else if (e.code == 'email-already-in-use') {
        message='The account already exists for that email.';}

      if (e.code == 'user-not-found') {
        message='No user found for that email.';

      } else if (e.code == 'wrong-password') {
        message='Wrong password provided for that user.';

      }
      navigator.hideloading();
      if(message!=null){
        navigator.showmessage(message);

      }

    } catch (e) {
      print(e);
    }

  }

}
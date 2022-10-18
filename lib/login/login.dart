
import 'package:c_s_s/home/adinhome.dart';
import 'package:c_s_s/home/homescreen.dart';
import 'package:c_s_s/provide.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../base.dart';
import '../shared/constant.dart';

import '../register/Register.dart';
import 'login-navigator.dart';
import 'login-view-model.dart';

class LoginScreen extends StatefulWidget {


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState <LoginScreen, LoginViewModel> implements LoginNavigator{
  LoginViewModel registerViewModel=LoginViewModel();
  GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  final adminpassword='203310203310';

  var emailController=TextEditingController();

  var passwordController=TextEditingController();
  @override
  void initState() {

    super.initState();
    registerViewModel.navigator= this;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (c)=>LoginViewModel(),
        child:Stack(
          children: [
            Center(child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_mjlh3hcy.json')==null?Image.asset('assets/images/singin.jpg'):Lottie.network('https://assets5.lottiefiles.com/packages/lf20_mjlh3hcy.json')),

            SafeArea(
              child: Form(
                key: globalKey,
                child:Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(
                            controller: emailController,

                            keyboardType:TextInputType.emailAddress,
                            obscureText: false,
                            decoration:InputDecoration(
                                hintText: 'Enter Email address',


                                enabledBorder: OutlineInputBorder(
                                  borderSide: Divider.createBorderSide(context),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:Colors.grey
                                  ),

                                ),
                                filled: true,
                                contentPadding:EdgeInsets.all(8)
                            ),
                            validator: (text){
                              if(text==null||text.trim().isEmpty) {
                                return 'please enter Email Name';
                              }
                              return null;
                            },),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: TextFormField(

                            controller: passwordController,
                            keyboardType:TextInputType.visiblePassword,
                            obscureText: true,
                            decoration:InputDecoration(
                                hintText: 'Enter pass word',


                                enabledBorder: OutlineInputBorder(
                                  borderSide: Divider.createBorderSide(context),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color:Colors.grey
                                  ),

                                ),
                                filled: true,
                                contentPadding:EdgeInsets.all(8)
                            ),
                            validator: (text){
                              if(text==null||text.trim().isEmpty) {
                                return 'please enter pass word';
                              }
                              return null;
                            },
                          ),
                        ),
                        ElevatedButton(onPressed:(){
                          LoginButton();
                        }, child: Text('Login')),
                        TextButton(onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>RegisterScreen()));
                        }, child: Text('Do not nave an account ?',style: TextStyle(fontSize: 15),)),

                      ],
                    ),
                  ),
                ),),
            )
          ],
        ),
      ),

    );
  }
  LoginButton() async {
    var provider=Provider.of<AdminPanel>(context,listen: false);
    if(globalKey.currentState!.validate()==true){
      globalKey.currentState?.save();
      var firebaseAuth=FirebaseAuth.instance;

      if(provider.isAdmine){
        if( passwordController.text==adminpassword){
          registerViewModel.login(context,emailController.text,passwordController.text);

          Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>AdmineHome()));

        }
        else{
          Center(
            child: Text('some Thing went Wrong'),
          );
        }

      }

      else{
        registerViewModel.login(context,emailController.text,passwordController.text);

        Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>HomeScreen()));


      }
      //login
    }

  }

  @override
  LoginViewModel initialviewmodel() {
    return LoginViewModel();
  }
}

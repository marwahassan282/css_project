
import 'package:c_s_s/register/register-navigator.dart';
import 'package:c_s_s/register/register-view-model.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../base.dart';
import '../shared/constant.dart';

import '../login/login.dart';

class RegisterScreen extends StatefulWidget {


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState <RegisterScreen, RegisterViewModel> implements RegisterNavigator {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  var FirstNameController = TextEditingController();

  var LastNameController = TextEditingController();

  var UserNameController = TextEditingController();

  var EmailNameController = TextEditingController();

  var passwordNameController = TextEditingController();

  RegisterViewModel registerViewModel = RegisterViewModel();

  @override
  void initState() {
    super.initState();
    registerViewModel.navigator = this;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (BuildContext context) => registerViewModel,
        child: Stack(
          children: [
            Center(child: Lottie.network('https://assets5.lottiefiles.com/packages/lf20_q5pk6p1k.json')==null?Image.asset('assets/images/signup.jpg'):Lottie.network('https://assets5.lottiefiles.com/packages/lf20_q5pk6p1k.json')),
            SafeArea(
              child: SingleChildScrollView (
                child: Form(
                  key: globalKey,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: FirstNameController,

                              keyboardType: TextInputType.text,
                              obscureText: false,
                              decoration: InputDecoration(
                                  hintText: 'Enter First Name',


                                  enabledBorder: OutlineInputBorder(
                                    borderSide: Divider.createBorderSide(context),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey
                                    ),

                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(8)
                              ),
                              validator: (text) {
                                if (text == null || text
                                    .trim()
                                    .isEmpty) {
                                  return 'please enter First Name';
                                }
                                return null;
                              },


                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: LastNameController,

                              keyboardType: TextInputType.text,
                              obscureText: false,
                              decoration: InputDecoration(
                                  hintText: 'Enter Last Name',


                                  enabledBorder: OutlineInputBorder(
                                    borderSide: Divider.createBorderSide(context),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey
                                    ),

                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(8)
                              ),
                              validator: (text) {
                                if (text == null || text
                                    .trim()
                                    .isEmpty) {
                                  return 'please enter Last Name';
                                }
                                return null;
                              },


                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: UserNameController,

                              keyboardType: TextInputType.text,
                              obscureText: false,
                              decoration: InputDecoration(
                                  hintText: 'Enter User  Name',


                                  enabledBorder: OutlineInputBorder(
                                    borderSide: Divider.createBorderSide(context),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey
                                    ),

                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(8)
                              ),
                              validator: (text) {
                                if (text == null || text
                                    .trim()
                                    .isEmpty) {
                                  return 'please enter User Name';
                                }
                                return null;
                              },


                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: EmailNameController,

                              keyboardType: TextInputType.emailAddress,
                              obscureText: false,
                              decoration: InputDecoration(
                                  hintText: 'Enter Email address',


                                  enabledBorder: OutlineInputBorder(
                                    borderSide: Divider.createBorderSide(context),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey
                                    ),

                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(8)
                              ),
                              validator: (text) {
                                if (text == null || text
                                    .trim()
                                    .isEmpty) {
                                  return 'please enter Email Name';
                                }
                                return null;
                              },),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(

                              controller: passwordNameController,
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: true,
                              decoration: InputDecoration(
                                  hintText: 'Enter pass word',


                                  enabledBorder: OutlineInputBorder(
                                    borderSide: Divider.createBorderSide(context),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey
                                    ),

                                  ),
                                  filled: true,
                                  contentPadding: EdgeInsets.all(8)
                              ),
                              validator: (text) {
                                if (text == null || text
                                    .trim()
                                    .isEmpty) {
                                  return 'please enter pass word';
                                }
                                return null;
                              },
                            ),
                          ),
                          ElevatedButton(onPressed: () {
                            FirebaseauthentictionButton();
                          }, child: Text('Register')),
                          TextButton(onPressed: () {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginScreen()));

                          },
                              child: Text(
                                'Aleardy have  account ?', style: TextStyle(
                                  fontSize: 15),))
                        ],
                      ),
                    ),
                  ),),
              ),
            ),
          ],
        ),
      ),

    );
  }
  void FirebaseauthentictionButton() async {
    if (globalKey.currentState!.validate()) {
      registerViewModel.CreateAccount(context,
          EmailNameController.text, passwordNameController.text,FirstNameController.text,LastNameController.text,UserNameController.text);
    }
  }

  @override
  RegisterViewModel initialviewmodel() {

    return RegisterViewModel ();
  }
}
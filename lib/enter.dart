import 'package:c_s_s/provide.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'login/login.dart';

class GoScreen extends StatelessWidget {
  static const String routeName='enter';
  const GoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children: [
          Center(child: Lottie.network('https://assets10.lottiefiles.com/packages/lf20_aao5ezov.json')==null?Image.asset('assets/images/singin.jpg'):Lottie.network('https://assets10.lottiefiles.com/packages/lf20_aao5ezov.json')),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: (){
                    var provider=Provider.of<AdminPanel>(context,listen: false) ;
                    provider.admin(true) ;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginScreen()));

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue
                        ),

                        child: Center(child: Text('Login as Admin ,',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),))),
                  )),
              SizedBox(height: 10,),
              GestureDetector(
                  onTap: (){
                    var provider=Provider.of<AdminPanel>(context,listen: false) ;
                    provider.admin(false) ;
                    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>LoginScreen()));

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.blue
                        ),

                        child: Container(

                            child: Center(child: Text('Login as user ,',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)))),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}

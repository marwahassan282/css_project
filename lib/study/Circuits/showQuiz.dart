
import 'dart:io';

import 'package:c_s_s/database/utils.dart';
import 'package:c_s_s/models/Quiz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/Lecture.dart';


class QuizScreen extends StatelessWidget {
  static const String routName = "jnkjnjihsdkncsd";
  String catagory;
  QuizScreen(this.catagory);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        title: Text(catagory,style: TextStyle(fontSize: 25,
        color: Color(0xF9000000),

    //Color(0xFF5D9CEC),
    fontWeight: FontWeight.w400,)),
    ),
     body:

         StreamBuilder<QuerySnapshot<Quiz>>(
                      stream: DataBaseUtils.getQuizFromFireBase(catagory),
                      builder:(context,snapshot) {
                        if(snapshot.connectionState==ConnectionState.waiting){
                          return Center(child: CircularProgressIndicator());
                        }
                        else if(snapshot.hasError){
                          return Text('some thing went wrong');
                        }
                        List<Quiz>quizes=snapshot.data?.docs.map((e) => e.data()).toList()??[];
                        return ListView.builder(
                            itemCount: quizes.length,
                            itemBuilder: (context,index){


                              return GestureDetector(
                                onTap: (){
                                  Gotofrist(quizes[index].description);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 100,
                                        child: Column(
                                          children: [
                                            Center(child: Text(quizes[index].title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                                            SizedBox(height: 12,),
                                            Text('${quizes[index].description}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),)
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(25),
                                            color: Colors.grey
                                        ),

                                      ),
                                      Positioned(
                                        bottom: 0,
                                          right: 0,
                                          child: Text('${formattime(quizes[index].datetime)}')),
                                    ],
                                  ),
                                ),
                              );

                            }
                        );

                      }
                  )





    );
  }
  Gotofrist(String url)async{
    var uri = Uri.parse(url);
    if (await canLaunchUrl(uri))
      await launchUrl(uri);
    else
      // can't launch url, there is some error
      throw "Could not launch $url";
  }
  
 String  formattime(int time){
    //from firebase
   DateTime.fromMicrosecondsSinceEpoch(time);
   return formatDate(DateTime.fromMicrosecondsSinceEpoch(time) , [dd, '/', mm, '/', yyyy, ' ', HH, ':', nn]);

    final df = new DateFormat('dd-MM-yyyy hh:mm a');
    int myvalue = time;
   return  df.format(new DateTime.fromMillisecondsSinceEpoch(myvalue*1000));
  }
}



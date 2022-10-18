import 'package:c_s_s/database/utils.dart';
import 'package:c_s_s/models/Lecture.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/local_notification_service.dart';

class AddLecture extends StatefulWidget {
  const AddLecture({Key? key}) : super(key: key);

  @override
  State<AddLecture> createState() => _AddLectureState();
}

class _AddLectureState extends State<AddLecture> {
  String ? selectedCatagory;
 GlobalKey<FormState> globalKey = GlobalKey<FormState>();
 List<String>carsType=['circut','control2','Data Structure','Logic Circuits','Maths 5','Presention Skill'];




  var titleController = TextEditingController();

  var descriptionController = TextEditingController();
  var titlenotificationController = TextEditingController();
  var descController = TextEditingController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
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
                        controller: titleController,

                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: 'Enter Name of Lecture',


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
                            return 'please enter Title';
                          }
                          return null;
                        },


                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: descriptionController,

                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: 'Enter Link of Lecture',


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
                        controller: titlenotificationController,

                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: 'Enter title of notification',


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
                            return 'please title of notification';
                          }
                          return null;
                        },


                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextFormField(
                        controller: descController,

                        keyboardType: TextInputType.text,
                        obscureText: false,
                        decoration: InputDecoration(
                            hintText: 'Enter description of notification',


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
                            return 'please description of notification';
                          }
                          return null;
                        },


                      ),
                    ),

                    DropdownButton(
                      iconSize: 26,
                      dropdownColor: Colors.black,
                      hint: const Text('choose your type of study',style: TextStyle(color: Colors.grey,fontSize: 20),),
                      onChanged: (newValue){
                        setState(() {
                          selectedCatagory=newValue.toString();
                        });
                      },
                      value: selectedCatagory,
                      items: carsType.map((car){
                        return DropdownMenuItem(
                            value: car,
                            child: Text(car.toString(),style: const TextStyle(color: Colors.grey,fontSize: 15),));

                      }).toList(),
                    ),


                    ElevatedButton(onPressed: () {
                      addleturetoFirebase();
                    }, child: Text('add',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
                    ElevatedButton(
                      onPressed: () async {
                        LocalNotificationService.showNotification(id: 0,title: titlenotificationController.text,
                            body: descController.text,payload: 'kkkkkk');
                      },
                      child: const Text('add notification'),
                    ),


                  ],
                ),
              ),
            ),),
        ),
      ),
    );
  }

  void addleturetoFirebase() {
    if (globalKey.currentState!.validate()){
      Lecture lecture=Lecture(catagory: selectedCatagory!, title: titleController.text, description: descriptionController.text);
      DataBaseUtils.CreateLecture(lecture);

    }

  }
}

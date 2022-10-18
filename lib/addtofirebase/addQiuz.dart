import 'package:c_s_s/database/utils.dart';
import 'package:c_s_s/models/Lecture.dart';
import 'package:c_s_s/models/Quiz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/local_notification_service.dart';

class AddQuiz extends StatefulWidget {
  const AddQuiz({Key? key}) : super(key: key);

  @override
  State<AddQuiz> createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  var selectedTime=DateTime.now();
  var titlenotificationController = TextEditingController();
  var descController = TextEditingController();
  String ? selectedCatagory;
 GlobalKey<FormState> globalKey = GlobalKey<FormState>();
 List<String>carsType=['circut','control2','Data Structure','Logic Circuits','Maths 5','Presention Skill'];




  var titleController = TextEditingController();

  var descriptionController = TextEditingController();


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
                            hintText: 'Enter Name of Quiz',


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
                            hintText: 'Enter Link of Qiuz',


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
                    InkWell(
                        onTap: (){
                          openDatePicker();
                        },
                        child: Text('${selectedTime.year} - ${selectedTime.month} - ${selectedTime.day}',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign:TextAlign.center)),
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
                      addQuiztoFirebase();
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

  void addQuiztoFirebase() {
    if (globalKey.currentState!.validate()){
      Quiz quiz=Quiz(catagory: selectedCatagory!, title: titleController.text, description: descriptionController.text, datetime: selectedTime.millisecondsSinceEpoch);
      DataBaseUtils.CreateQuiz(quiz);

    }

  }
  openDatePicker()async{
    var chosenDate= await showDatePicker(context: context, initialDate: selectedTime, firstDate: DateTime.now(), lastDate:DateTime.now().add(Duration(days: 365)));
    if(chosenDate!=null){
      selectedTime=chosenDate;

    }
    setState(() {

    });
  }
}

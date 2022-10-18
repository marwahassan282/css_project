import 'package:c_s_s/models/Assiment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/Lecture.dart';
import '../models/Quiz.dart';
import '../models/Section.dart';
import '../models/my-user.dart';

class DataBaseUtils{

  static CollectionReference<MyUser> getUserCollection(){
    return FirebaseFirestore.instance.collection(MyUser.collctionName).withConverter(
        fromFirestore: (snapshot,op)=>MyUser.fromjoson(snapshot.data()!),
        toFirestore: (user,op)=>user.tojoson());



  }
  static CollectionReference<Lecture> getlectureCollection(){
    return FirebaseFirestore.instance.collection('lecture').withConverter(
        fromFirestore: (snapshot,op)=>Lecture.fromJson(snapshot.data()!),
        toFirestore: (lec,op)=>lec.toJson());



  }
  static CollectionReference<Section> getsectionCollection(){
    return FirebaseFirestore.instance.collection('setion').withConverter(
        fromFirestore: (snapshot,op)=>Section.fromJson(snapshot.data()!),
        toFirestore: (sec,op)=>sec.toJson());



  }

  static CollectionReference<Quiz> getQuizCollection(){
    return FirebaseFirestore.instance.collection('Quiz').withConverter(
        fromFirestore: (snapshot,op)=>Quiz.fromJson(snapshot.data()!),
        toFirestore: (quiz,op)=>quiz.toJson());



  }

  static CollectionReference<Assiment> getAssimentCollection(){
    return FirebaseFirestore.instance.collection('Assiment').withConverter(
        fromFirestore: (snapshot,op)=>Assiment.fromJson(snapshot.data()!),
        toFirestore: (assiment,op)=>assiment.toJson());



  }
  static Future<void>CreateDbUser(MyUser user){

    return getUserCollection().doc(user.id).set(user);
  }
  static Future<void>CreateLecture(Lecture lecture){
Lecture lect=Lecture(title: lecture.title, description: lecture.description,catagory: lecture.catagory);
    return getlectureCollection().doc().set(lect);
  }
  static Future<void>Createsection(Section section){
    Section sec=Section(title: section.title, description: section.description, catagory: section.catagory);
    return getsectionCollection().doc().set(sec);
  }
  static Future<void>CreateQuiz(Quiz quiz){
    Quiz qui=Quiz(title: quiz.title, description: quiz.description,catagory: quiz.catagory, datetime: quiz.datetime,);
    return getQuizCollection().doc().set(qui);
  }
  static Future<void>CreateAssiment(Assiment assiment){
    Assiment ass=Assiment(title: assiment.title, description: assiment.description,catagory: assiment.catagory, datetime: assiment.datetime,);
    return getAssimentCollection().doc().set(ass);
  }

 static Stream<QuerySnapshot<Lecture>> getLectureFromFireBase(String catagory) {
    var gettask = getlectureCollection();
    return gettask.where('catagory', isEqualTo: catagory).snapshots();
  }
 static Stream<QuerySnapshot<Section>> getSectioneFromFireBase(String catagory) {
    var gettask = getsectionCollection();
    return gettask.where('catagory', isEqualTo: catagory).snapshots();
  }
  static Stream<QuerySnapshot<Quiz>> getQuizFromFireBase(String catagory) {
    var gettask = getQuizCollection();
    return gettask.where('catagory', isEqualTo: catagory).snapshots();
  }
  static Stream<QuerySnapshot<Assiment>> getAssimentFromFireBase(String catagory) {
    var gettask = getAssimentCollection();
    return gettask.where('catagory', isEqualTo: catagory).snapshots();
  }

}
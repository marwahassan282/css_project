class Lecture {
  static const String CollectionNameLecture='Lecture';
  String catagory;
  String title;
  String description;
  //int datetime;
  bool isDone;

  Lecture({
    required this.catagory,
    required this.title,
    required this.description,
    //required this.datetime,
    this.isDone = false,
  });

  Lecture.fromJson(Map<String, dynamic> json)
      : this(

      title: json['title'] as String,
      description: json['description'] as String,
      catagory: json['catagory'],
      //datetime: json['date'] as int,
      isDone: json['isDone'] as bool);

  Map<String, dynamic> toJson() {
    return {
      'catagory': catagory,
      'title': title,
      'description': description,
      //'date': datetime,
      'isDone': isDone
    };
  }
}

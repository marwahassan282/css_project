class Assiment {
  static const String CollectionNameLecture='Lecture';
  String catagory;
  String title;
  String description;
  int datetime;
  bool isDone;

  Assiment({
    required this.catagory,
    required this.title,
    required this.description,
    required this.datetime,
    this.isDone = false,
  });

  Assiment.fromJson(Map<String, dynamic> json)
      : this(

      title: json['title'] as String,
      description: json['description'] as String,
      catagory: json['catagory'],
      datetime: json['datetime'] as int,
      isDone: json['isDone'] as bool);

  Map<String, dynamic> toJson() {
    return {
      'catagory': catagory,
      'title': title,
      'description': description,
      'datetime': datetime,
      'isDone': isDone
    };
  }
}

class Section {
  static const String CollectionNameSection='Section';
  String catagory;
  String title;
  String description;

  bool isDone;

  Section({
    required this.catagory,
    required this.title,
    required this.description,

    this.isDone = false,
  });

  Section.fromJson(Map<String, dynamic> json)
      : this(
      catagory: json['catagory'] as String,
      title: json['title'] as String,
      description: json['description'] as String,

      isDone: json['isDone'] as bool);

  Map<String, dynamic> toJson() {
    return {
      'catagory':catagory,
      'title': title,
      'description': description,

      'isDone': isDone
    };
  }
}
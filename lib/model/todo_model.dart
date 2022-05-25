class TodoModel {
  TodoModel(
      {required this.title, required this.date, this.link, this.description});
  String title;
  DateTime date;
  String? link;
  String? description;
  TodoModel copyWith({
    String? title,
    String? link,
    String? description,
  }) {
    return TodoModel(
      title: title ?? this.title,
      date: date,
      link: link ?? this.link,
      description: description ?? this.description,
    );
  }
}

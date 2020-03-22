
class Person {
 final int userId;
 final int id;
 final String title;
 final String body;

  Person({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    userId: json['userId'],
    id: json['id'],
    title: json['title'],
    body: json['body'],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "body": body,
  };
}

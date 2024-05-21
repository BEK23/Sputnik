// To parse this JSON data, do
//
//     final course = courseFromJson(jsonString);

import 'dart:convert';

List<Course> courseFromJson(String str) =>
    List<Course>.from(json.decode(str).map((x) => Course.fromJson(x)));

String courseToJson(List<Course> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Course {
  String titleRu;
  String titleUz;
  int? progress;
  String backgroud;
  bool? closed;

  Course({
    required this.titleRu,
    required this.titleUz,
    this.progress,
    required this.backgroud,
    this.closed = true,
  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(
        titleRu: json["titleRu"],
        titleUz: json["titleUz"],
        progress: json["progress"],
        backgroud: json["backgroud"],
        closed: json["closed"],
      );

  Map<String, dynamic> toJson() => {
        "titleRu": titleRu,
        "titleUz": titleUz,
        "progress": progress,
        "backgroud": backgroud,
        "closed": closed,
      };
}

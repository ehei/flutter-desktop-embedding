import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note {
  int id;

  String title;
  String description;
  String date;
  int priority;

  Note(this.title, this.date, this.priority, [this.description]);
  Note.withId(this.id, this.title, this.date, this.priority,
      [this.description]);

  Note.fromMapObject(Map<String, dynamic> map) {
    this.id = map['id'];
    this.date = map['date'];
    this.title = map['title'];
    this.priority = map['priority'];
    this.description = map['description'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['title'] = title;
    map['description'] = description;
    map['priority'] = priority;
    map['date'] = date;

    return map;
  }

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);
}

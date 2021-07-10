import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:notes_on_english_literature/domain/notes/models/note.dart';

class NoteList {
  final List<Note> noteList;
  final String imagePath;
  final String noteId;
  final String uid;
  NoteList({
    this.noteList = const <Note>[],
    this.imagePath = '',
    this.noteId = '',
    this.uid = '',
  });

  NoteList copyWith({
    List<Note>? noteList,
    String? imagePath,
    String? noteId,
    String? uid,
  }) {
    return NoteList(
      noteList: noteList ?? this.noteList,
      imagePath: imagePath ?? this.imagePath,
      noteId: noteId ?? this.noteId,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'noteList': noteList.map((x) => x.toMap()).toList(),
      'imagePath': imagePath,
      'noteId': noteId,
      'uid': uid,
    };
  }

  factory NoteList.fromMap(Map<String, dynamic> map) {
    return NoteList(
      noteList: List<Note>.from(map['noteList']
          ?.map((Map<String, dynamic> x) => Note.fromMap(x)) as List<Note>),
      imagePath: map['imagePath'] as String,
      noteId: map['noteId'] as String,
      uid: map['uid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NoteList.fromJson(String source) =>
      NoteList.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NoteList(noteList: $noteList, imagePath: $imagePath, noteId: $noteId, uid: $uid)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is NoteList &&
        listEquals(other.noteList, noteList) &&
        other.imagePath == imagePath &&
        other.noteId == noteId &&
        other.uid == uid;
  }

  @override
  int get hashCode {
    return noteList.hashCode ^
        imagePath.hashCode ^
        noteId.hashCode ^
        uid.hashCode;
  }
}

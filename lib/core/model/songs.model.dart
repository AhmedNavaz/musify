import 'package:cloud_firestore/cloud_firestore.dart';

class SongsModel {
  String? songTitle;
  String? songGenre;
  String? songUrl;
  String? songName;
  String? songDescription;

  SongsModel(
      {this.songTitle,
      this.songGenre,
      this.songUrl,
      this.songName,
      this.songDescription});

  SongsModel.fromDocumentSnapshot(DocumentSnapshot json) {
    songTitle = json['songTitle'];
    songGenre = json['songGenre'];
    songUrl = json['songUrl'];
    songName = json['songName'];
    songDescription = json['songDescription'];
  }

  Map<String, dynamic> toJson() => {
        'songTitle': songTitle,
        'songGenre': songGenre,
        "songUrl": songUrl,
        "songName": songName,
        "songDescription": songDescription,
      };
}

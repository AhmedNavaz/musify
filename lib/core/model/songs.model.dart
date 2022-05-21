import 'package:cloud_firestore/cloud_firestore.dart';

class SongsModel {
  String? songId;
  String? songTitle;
  String? songGenre;
  String? songUrl;
  String? songName;
  String? songDescription;

  SongsModel(
      {this.songTitle,
        this.songId,
      this.songGenre,
      this.songUrl,
      this.songName,
      this.songDescription});

  SongsModel.fromDocumentSnapshot(DocumentSnapshot json) {
    songId = json.id;
    songTitle = json['songTitle'];
    songGenre = json['songGenre'];
    songUrl = json['songUrl'];
    songName = json['songName'];
    songDescription = json['songDescription'];
  }

  Map<String, dynamic> toJson() => {
        'songId': songId,
        'songTitle': songTitle,
        'songGenre': songGenre,
        "songUrl": songUrl,
        "songName": songName,
        "songDescription": songDescription,
      };
}

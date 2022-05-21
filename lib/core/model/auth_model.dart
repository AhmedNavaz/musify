import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:musify/core/model/playlist.model.dart';
import 'package:musify/core/model/songs.model.dart';
import 'package:musify/core/model/uploads.model.dart';

class AuthModel {
  String? uid;
  String? username;
  String? email;
  String? password;
  String? gender;
  String? avatar;
  Timestamp? createdAt;
  List<PlaylistsModel>? playlists = <PlaylistsModel>[];
  List<SongsModel>? songs = <SongsModel>[];

  AuthModel({
    this.uid,
    this.username,
    this.email,
    this.password,
    this.gender,
    this.avatar,
    this.createdAt,
    this.playlists,
    this.songs,
  });

  AuthModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    uid = doc.id;
    username = doc['username'];
    gender = doc['gender'];
    email = doc['email'];
    avatar = doc['avatar'];
    createdAt = doc['createdAt'];
     doc['playlists'].forEach((e){
       playlists!.add(PlaylistsModel.fromDocumentSnapshot(e));
    });
    doc['songs'].forEach((e){
      songs!.add(SongsModel.fromDocumentSnapshot(e));
    })
;  }


  Map<String, dynamic> toJson() => {
    'uid': uid,
    'username': username,
    'gender': gender,
    'avatar': avatar,
    'createdAt': createdAt,
    'playlists': playlists!.map((e) => e.toJson()).toList(),
    'songs': songs!.map((e) => e.toJson()).toList(),
  };

}

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
  UploadsModel? uploads;
  List<PlaylistsModel>? likedPlaylists;
  List<SongsModel>? likedSongs;

  AuthModel({
    this.uid,
    this.username,
    this.email,
    this.password,
    this.gender,
    this.avatar,
    this.createdAt,
    this.uploads,
    this.likedPlaylists,
    this.likedSongs,
  });

  AuthModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    uid = doc.id;
    username = doc['username'];
    gender = doc['gender'];
    email = doc['email'];
    avatar = doc['avatar'];
    createdAt = doc['createdAt'];
    uploads = UploadsModel.fromDocumentSnapshot(doc['uploads']);
    doc['likedPlaylists'].forEach((e){
      likedPlaylists!.add(PlaylistsModel.fromDocumentSnapshot(e));
    });
    doc['likedSongs'].forEach((e){
      likedSongs!.add(SongsModel.fromDocumentSnapshot(e));
    });
  }


  Map<String, dynamic> toJson() => {
    'uid': uid,
    'username': username,
    'gender': gender,
    'avatar': avatar,
    'createdAt': createdAt,
    'uploads': uploads,
    'likedPlaylists': likedPlaylists!.map((e) => e.toJson()).toList(),
    'likedSongs': likedSongs!.map((e) => e.toJson()).toList(),
  };

}

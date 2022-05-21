import 'package:cloud_firestore/cloud_firestore.dart';
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

  AuthModel({
    this.uid,
    this.username,
    this.email,
    this.password,
    this.gender,
    this.avatar,
    this.createdAt,
    this.uploads
  });

  AuthModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    uid = doc.id;
    username = doc['username'];
    gender = doc['gender'];
    email = doc['email'];
    avatar = doc['avatar'];
    createdAt = doc['createdAt'];
    uploads = doc['uploads'];
  }


  Map<String, dynamic> toJson() => {
    'uid': uid,
    'username': username,
    'gender': gender,
    'avatar': avatar,
    'createdAt': createdAt,
    'uploads': uploads,
  };

}

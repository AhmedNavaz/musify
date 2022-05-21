import 'package:cloud_firestore/cloud_firestore.dart';

class AuthModel {
  String? uid;
  String? username;
  String? email;
  String? password;
  String? gender;
  String? avatar;
  Timestamp? createdAt;

  AuthModel({
    this.uid,
    this.username,
    this.email,
    this.password,
    this.gender,
    this.avatar,
    this.createdAt,
  });

  AuthModel.fromDocumentSnapshot(DocumentSnapshot doc) {
    uid = doc.id;
    username = doc['username'];
    gender = doc['gender'];
    email = doc['email'];
    avatar = doc['avatar'];
    createdAt = doc['createdAt'];
  }
}

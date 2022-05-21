import 'package:cloud_firestore/cloud_firestore.dart';

class PlaylistsModel {

  String? name;
  String? description;
  String? imagePath;


  PlaylistsModel({this.name,
    this.description,
    this.imagePath});

  PlaylistsModel.fromDocumentSnapshot(DocumentSnapshot json){
    name = json['name'];
    description = json['description'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() =>
      {'name': name, 'description': description,
        "imagePath": imagePath,
      };

}
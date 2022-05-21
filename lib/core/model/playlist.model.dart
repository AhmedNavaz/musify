import 'package:cloud_firestore/cloud_firestore.dart';

class PlaylistsModel {
  String? playlistId;
  String? name;
  String? description;
  String? imagePath;

  PlaylistsModel(
      {this.name, this.playlistId, this.description, this.imagePath});

  PlaylistsModel.fromDocumentSnapshot(DocumentSnapshot json) {
    playlistId = json.id;
    name = json['name'];
    description = json['description'];
    imagePath = json['imagePath'];
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'playlistId': playlistId,
        'description': description,
        "imagePath": imagePath,
      };
}

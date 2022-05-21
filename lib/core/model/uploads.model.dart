import 'package:musify/core/model/playlist.model.dart';
import 'package:musify/core/model/songs.model.dart';

class UploadsModel {
  String? uploadId;
  String? artistUid;
  String? artistName;
  List<PlaylistsModel>? playlists;
  List<SongsModel>? songs;

  UploadsModel(
      {this.uploadId,
      this.artistUid,
      this.artistName,
      this.playlists,
      this.songs});

  UploadsModel.fromDocumentSnapshot(Map<String, dynamic> json) {
    uploadId = json['uploadId'];
    artistUid = json['artistUid'];
    artistName = json['artistName'];
    json['playlists'].forEach((e) {
      playlists!.add(PlaylistsModel.fromDocumentSnapshot(e));
    });
    json['songs'].forEach((e) {
      songs!.add(SongsModel.fromDocumentSnapshot(e));
    });
  }

  Map<String, dynamic> toJson() => {
        'uploadId': uploadId,
        'artistUid': artistUid,
        'artistName': artistName,
        'playlists': playlists?.map((e) => e.toJson()).toList(),
        'songs': songs?.map((e) => e.toJson()).toList(),
      };
}

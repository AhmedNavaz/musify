import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:musify/app/constants/controller.constant.dart';
import 'package:musify/core/model/playlist.model.dart';
import 'package:musify/core/model/uploads.model.dart';
import 'package:musify/core/router/router_generator.dart';
import 'package:musify/meta/utils/hive_database.dart';
import '../../components/custom_snackbar.dart';
import '../model/auth_model.dart';

class AuthProviderNotifier extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthModel currentUser = AuthModel();
  final googleSignIn = GoogleSignIn();
  final facebookLogin = FacebookLogin();

  List<AuthModel> allArtists = <AuthModel>[];
  /* 
  * sign up
  */
  Future<bool> signup(AuthModel user) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);
      if (userCredential.user != null) {
        var uid = userCredential.user?.uid;
        if (await writeUserToDatabase(uid, user)) {
          // navigationController.getOffAll(RouteGenerator);
        }
      }
      return true;
    } on FirebaseAuthException catch (e) {
      print(e.message);
      CustomSnackBar.showErrorSnackBar(title: "${e.message}", message: "");
      return false;
    }
  }

  /*
  * login
  */
  Future<bool> login(AuthModel user) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: user.email!, password: user.password!);

      if (userCredential.user != null) {
        var uid = userCredential.user?.uid;
        saveUidToHive(uid ?? "");
        await getUser(uid ?? "");
        return true;
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
      CustomSnackBar.showErrorSnackBar(title: "${e.message}", message: "");
    }

    return false;
  }

  Future<bool> writeUserToDatabase(uid, AuthModel user) async {
    var map = {
      "uid": uid,
      "username": user.username?.trim(),
      "email": user.email?.trim(),
      "avatar": user.avatar ?? '',
      "gender": user.gender,
      "uploads": user.uploads,
      'likedPlaylists' : user.likedPlaylists?.map((e) => e.toJson()).toList(),
      'likedSongs' : user.likedSongs?.map((e) => e.toJson()).toList(),
      "createdAt": Timestamp.now(),
    };
    await FirebaseFirestore.instance.collection("artists").doc(uid).set(map);

    CustomSnackBar.showSuccessSnackBar(
        title: "Account registered successfully!", message: "");

    saveUidToHive(uid ?? "");
    return true;
  }

  isNewUser(User? _user) async {
    if (_user == null) {
      return false;
    } else {
      DocumentSnapshot doc =
          await _firestore.collection("artists").doc(_user.uid).get();
      return doc.exists;
    }
  }

  Future<AuthModel> getUser(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection("artists").doc(uid).get();
      if (!doc.exists) {
        CustomSnackBar.showErrorSnackBar(
          title: "Not Authorized",
          message: '',
        );
      }
      currentUser = AuthModel.fromDocumentSnapshot(doc);
      print(currentUser);
      return currentUser;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<void> loadAllArtists() async {
    Stream<QuerySnapshot<Map<String, dynamic>>> test = _firestore.collection('artists').where('uid', isNotEqualTo: HiveDatabase.getValue(HiveDatabase.authUid)).snapshots();
    test.forEach((element) {
      element.docs.forEach((element) {
        allArtists.add(AuthModel.fromDocumentSnapshot(element));
      });
    });
  }

  Future likePlaylist(PlaylistsModel playlist) async {

  }

  Future createUserWithSocial() async {
    Future.delayed(const Duration(milliseconds: 1000), () async {
      bool isNew = await isNewUser(_auth.currentUser);
      AuthModel _user = AuthModel(
        uid: _auth.currentUser!.uid,
        username: _auth.currentUser!.displayName,
        email: _auth.currentUser!.email,
        avatar: _auth.currentUser!.photoURL,
        gender: '',
        uploads: UploadsModel(playlists: [], songs: []),
        likedPlaylists: [],
        likedSongs: [],
        createdAt: Timestamp.now(),

      );
      if (!isNew) {
        if (await writeUserToDatabase(_user.uid, _user)) {
          currentUser = _user;
          notifyListeners();
        } else {
          getUser(_auth.currentUser!.uid).then((value) {
            currentUser = value;
            notifyListeners();
          });
        }
      }
      navigationController.getOffAll(RouteGenerator.home);
    });
  }

  // GOOGLE LOGIN

  void loginWithGoogle() async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      _auth.signInWithCredential(credential).then((value) {
        saveUidToHive(value.user?.uid ?? "");
        createUserWithSocial();
      });
      // isLoading = false;
    } catch (e) {
      CustomSnackBar.showErrorSnackBar(
          title: "Error login Account", message: "");
      rethrow;
    }
  }

  // sign in with facebook

  void loginWithFacebook() async {
    final fbUser = await facebookLogin.logIn(['email']);
    switch (fbUser.status) {
      case FacebookLoginStatus.cancelledByUser:
        // isLoading = false;
        break;
      case FacebookLoginStatus.error:
        break;
      case FacebookLoginStatus.loggedIn:
        try {
          final FacebookAccessToken fbToken = fbUser.accessToken;
          final AuthCredential credential =
              FacebookAuthProvider.credential(fbToken.token);

          _auth.signInWithCredential(credential).then((value) {
            createUserWithSocial();
          });
          // isLoading = false;
        } catch (e) {
          CustomSnackBar.showErrorSnackBar(
              title: "Error login Account", message: "");
        }
    }
  }

  Future<void> createPlayListAndSong(bool playlistSelected,
      {required String playlistId,
      File? playListFile,
      required String playListName,
      required String playlistDescription,
      required String songName,
      required String songGenre,
      required String description,
      File? songFile}) async {
    if (!playlistSelected) {
      String uid = HiveDatabase.getValue(HiveDatabase.authUid);
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('artists')
          .child(uid)
          .child('uploads')
          .child(playListName);
      UploadTask uploadTask = ref.putFile(playListFile!);
      await uploadTask.whenComplete(() async {
        await ref.getDownloadURL().then((value) async {
          var map = {
            "avatar": value,
          };

          await FirebaseFirestore.instance
              .collection("artists")
              .doc(uid)
              .update(map);
          CustomSnackBar.showSuccessSnackBar(
              title: "Avatar updated", message: '');
        });
      });
    }
  }

  /*
  * Update Avatar
  */
  void updateAvatar(file) async {
    String uid = HiveDatabase.getValue(HiveDatabase.authUid);
    CustomSnackBar.showSuccessSnackBar(title: "Starting Upload", message: '');
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("images")
        .child(uid)
        .child("avatar");

    UploadTask uploadTask = ref.putFile(file);
    await uploadTask.whenComplete(() async {
      await ref.getDownloadURL().then((value) async {
        var map = {
          "avatar": value,
        };

        await FirebaseFirestore.instance
            .collection("artists")
            .doc(uid)
            .update(map);
        CustomSnackBar.showSuccessSnackBar(
            title: "Avatar updated", message: '');
      });
    });
  }

  /*
  * Logout
  */
  Future logout(context) async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
    await facebookLogin.logOut();
    // await AppPref().setLoggedIn(false);
    HiveDatabase.storeValue(HiveDatabase.loginCheck, false);
    navigationController.getOffAll(RouteGenerator.welcomeScreen);
  }

  void saveUidToHive(String uid) {
    HiveDatabase.storeValue(HiveDatabase.loginCheck, true);
    HiveDatabase.storeValue(HiveDatabase.authUid, uid);
  }
}

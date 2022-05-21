import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import '../../components/custom_snackbar.dart';
import '../model/auth_model.dart';

class AuthProviderNotifier extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AuthModel currentUser = AuthModel();
  final googleSignIn = GoogleSignIn();
  final facebookLogin = FacebookLogin();

  /* 
  * sign up
  */
  Future<bool> signup(BuildContext context, AuthModel user) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: user.email!, password: user.password!);
      if (userCredential.user != null) {
        var uid = userCredential.user?.uid;
        await writeUserToDatabase(uid, user);
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
      "id": uid,
      "username": user.username?.trim(),
      "email": user.email?.trim(),
      "avatar": user.avatar ?? '',
      "gender": user.gender,
      "timestamp": Timestamp.now(),
    };
    await FirebaseFirestore.instance.collection("artists").doc(uid).set(map);
    CustomSnackBar.showSuccessSnackBar(
        title: "Account registered successfully!", message: "");
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
      return AuthModel.fromDocumentSnapshot(doc);
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
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
}

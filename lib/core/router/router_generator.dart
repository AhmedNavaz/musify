import 'package:flutter/material.dart';
import 'package:musify/meta/views/authentication/body.dart';
import 'package:musify/meta/views/authentication/signin.dart';
import 'package:musify/meta/views/authentication/signup.dart';
import 'package:musify/meta/views/bottom_navigation/add/add_playlist.dart';
import 'package:musify/meta/views/bottom_navigation/body.dart';
import 'package:musify/meta/views/comment_screen.dart';
import 'package:musify/meta/views/edit_profile.dart';
import 'package:musify/meta/views/media_player.dart';
import 'package:musify/meta/views/profile_screen.dart';
import 'package:musify/meta/views/splash/splash_screen.dart';
import 'package:musify/meta/views/upload_music.dart';

class RouteGenerator {
  // TODO : ROUTES GENERATOR CLASS THAT CONTROLS THE FLOW OF NAVIGATION/ROUTING

  // WELCOME ROUTE
  static const String splashScreen = '/splash-screen';

  // AUTH ROUTE
  static const String welcomeScreen = '/welcome-screen';
  static const String loginScreen = '/login-screen';
  static const String signupScreen = '/signup-screen';
  static const String home = '/home';
  static const String mediaPlayer = '/media-player';
  static const String profile = '/profile';
  static const String editProfile = '/edit-profile';
  static const String addPlaylist = '/add-playlist';
  static const String uploadMusic = '/upload-music';
  static const String commentScreen = '/comment-screen';
  static const String forgotPasswordScreen = '/forgot-password-screen';
  static const String enterPhoneNumberScreen = '/enter-phone-number-screen';
  static const String createNewPassword = '/create-new-password-screen';

  // FUNCTION THAT HANDLES ROUTING
  static Route<dynamic> onGeneratedRoutes(RouteSettings settings) {
    Map<String, dynamic> args = {};
    // GETTING ARGUMENTS IF PASSED
    if (settings.arguments != null) {
      args = settings.arguments as Map<String, dynamic>;
      debugPrint("${settings.arguments}");
    }
    debugPrint(settings.name);

    switch (settings.name) {
      case splashScreen:
        return _getPageRoute(const SplashScreen());

      case welcomeScreen:
        return _getPageRoute(const SignBody());

      case signupScreen:
        return _getPageRoute(SignupView());

      case loginScreen:
        return _getPageRoute(SigninView());

      case home:
        return _getPageRoute(const NavBody());

      case mediaPlayer:
        return _getPageRoute(const MediaPlayerView());

      case profile:
        return _getPageRoute(ProfileScreen());

      case editProfile:
        return _getPageRoute(const EditProfile());

      case addPlaylist:
        return _getPageRoute( AddPlaylist(playlistId: args['playlistId'],));

      case uploadMusic:
        return _getPageRoute(UploadMusic(
          isFromPlaylist: args['fromPlaylist'],
          playlistDescription: args['desc'],
          playlistName: args['playlistName'],
          playlistFile: args['playlistFile'],
          playlistId: args['playlistId'],
        ));

      case commentScreen:
        return _getPageRoute(const CommentsScreen());

      default:
        return _errorRoute();
    }
  }

  // FUNCTION THAT HANDLES NAVIGATION
  static PageRoute _getPageRoute(Widget child) {
    return MaterialPageRoute(builder: (ctx) => child);
  }

  // 404 PAGE
  static PageRoute _errorRoute() {
    return MaterialPageRoute(builder: (ctx) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('404'),
        ),
        body: const Center(
          child: Text('ERROR 404: Not Found'),
        ),
      );
    });
  }
}

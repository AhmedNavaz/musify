import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color darkBackgroundColor = Color(0xFF181C1E);
  static const Color lightBackgroundColor = Color(0xFFFFFFFF);
  static const Color lightComponentsColor = Color(0xFF40CAFF);
  static const Color lightCardColor = Color(0xFFF4F8FA);

  static const Color errorColor = Color(0xFFD73A49);
  static const Color btnColor = Color(0xFFFF9900);
  static const Color lightTextColor = Color(0xFFF4F8FA);
  static const Color fieldTextColor = Color(0xFFF2F2F2);
  static const Color dotTextColor = Color(0xFF707070);
  static const Color darkTextColor = Color(0xFF181C1E);
  static const Color boxShadowColor = Color(0x1F000000);
  static const Color splashColor = Color(0x1F000000);
  static const Color graphColorPurple = Color(0xFFC855CB);
  static const Color graphColorOrange = Color(0xFFFF9900);

  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF282828);
  static const Color hintColor = Color(0xFFD1D1D1);
  static const Color textFieldUnderline = Color(0xFF808285);
  static const Color homeScreenHorizontalListviewBg = Color(0xFF353536);
  static const Color unSelectedCategoryColor = Color(0xFF4A4A4B);
  static const Color dividerColor = Color(0xFFC4C4C4);
  static const Color screenBackgroundColor = Color(0xFFF5F5F5);
  static const Color bottomNavBarBackground = Color(0xFFFFFFFF);
  static const Color selectedNavBarItemColor = Color(0xFFB59E5C);
  static const Color appointmentsCardColor = Color(0xFFE4F2FF);

  static const Color primaryColor = Color(0xFFB59E5C);
  static const Color subtitleLightGreyColor = Color(0xFF8D8D8D);

  static const Color shadowColorHomePage = Color(0xFF000000);

  static const Color approveNotificationColor = Color(0xFF27D94E);
  static const Color confirmedAppointment = Color(0xFF24DF4D);

  static const Color declineNotificationColor = Color(0xFFFF4A3F);
  static const Color cancelledAppointment = Color(0xFFD73A49);
  static const Color profileListTileColor = Color(0xFFE4EFF6);

  static const Color selectedNavBarBackgroundColor = Color(0xFF282828);
  static const Color selectedYellowColor = Color(0xFFFFCB74);
  static const Color reviewStarColor = Color(0xFFFFC107);
  static const Color reviewPostColor = Color(0xFF0085E3);

  static const Color unSelectedNavBarItemColor = Color(0xFF9A9B9B);

  static LinearGradient homeServiceLinearGradient = const LinearGradient(
    colors: [
      Color(0xFF93D2FF),
      Color(0xFFFFFFFF),
    ],
    begin: FractionalOffset.centerLeft,
    end: FractionalOffset.centerRight,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: GoogleFonts.montserrat().fontFamily,
      primaryColor: lightBackgroundColor,
      backgroundColor: darkBackgroundColor,
      scaffoldBackgroundColor: darkBackgroundColor,
      primaryColorLight: const Color(0xFFF1F1F1),
      splashColor: splashColor,
      brightness: Brightness.light,
      errorColor: errorColor,
      accentColorBrightness: Brightness.light,
      highlightColor: splashColor,
      focusColor: primaryColor,
      iconTheme: const IconThemeData(color: Colors.black),
      textTheme: TextTheme(
        headline1: TextStyle(
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
          color: primaryColor,
        ),
        headline2: TextStyle(
          fontSize: 15.sp,
          color: whiteColor,
        ),
        headline3: TextStyle(
          fontSize: 18.sp,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        headline5: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontSize: 12.sp,
          color: whiteColor,
        ),
        bodyText2: TextStyle(
          fontSize: 12.sp,
          color: blackColor,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: bottomNavBarBackground, elevation: 3),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: hintColor,
          fontSize: 12.sp,
        ),
      ),
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          onPrimary: Colors.white,
          // padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          primary: whiteColor,
          shape: RoundedRectangleBorder(
              //to set border radius to button
              borderRadius: BorderRadius.circular(30)),
        ),
      ),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: primaryColor),
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(
            secondary: const Color(0xFF79A6DC),
            brightness: Brightness.light,
          )
          .copyWith(secondary: primaryColor)
          .copyWith(secondary: primaryColor),
    );
  }
}

extension MyThemeData on ThemeData {
  bool get isDarkTheme => brightness == Brightness.dark;

  bool get isLightTheme => brightness == Brightness.light;
}

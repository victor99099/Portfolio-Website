import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant{
  static Color primaryColor = const Color(0xFF00EEFF);
  static Color primaryColor2 = const Color(0xFF00EEFF);
  static Color textColor = const Color(0xFF1F242D);
  static Color backgroundColor= const Color(0xFF1F242D);
  static Color cardColor= const Color.fromARGB(255, 21, 24, 32);
  static Color cardColor2=const Color.fromARGB(255, 0, 0, 0);
  

}

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColorLight: const Color.fromARGB(255, 190, 190, 190),
        primaryColorDark: Colors.black,
        primaryColor: const Color.fromARGB(255, 134, 133, 133),
        canvasColor: Colors.white,
        cardColor: Colors.white,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: WidgetStatePropertyAll(AppConstant.primaryColor),
          trackColor: WidgetStatePropertyAll(Colors.blue[300]),
          trackBorderColor: const WidgetStatePropertyAll(Colors.grey),
        ),
        // highlightColor: const Color.fromARGB(255, 98, 46, 128),
        // shadowColor: const Color.fromARGB(255, 98, 46, 128),
        // indicatorColor: const Color.fromARGB(255, 250, 242, 255),
        // navigationBarTheme: NavigationBarThemeData(
        //   backgroundColor: Colors.white,
        //   // indicatorColor: AppConstant.primary,
        //   labelTextStyle: MaterialStateProperty.all(
        //     const TextStyle(
        //       color: Colors.black,
              
        //     ),
        //   ),
        //   iconTheme: MaterialStateProperty.all(
        //     const IconThemeData(color: Colors.black),
        //   ),
        // ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColor: const Color(0xFFD6D6D6),
        primaryColorDark: Colors.white,
        primaryColorLight: const Color.fromARGB(255, 189, 189, 189),
        canvasColor: const Color(0xFF242424),
        cardColor: const Color.fromARGB(255, 82, 82, 82),
        // highlightColor: Colors.white,
        // shadowColor: const Color.fromARGB(255, 19, 18, 18),
        // indicatorColor: const Color.fromARGB(255, 82, 82, 82),
        // navigationBarTheme: NavigationBarThemeData(
        //   backgroundColor: Colors.white,
        //   // indicatorColor: AppConstant.primary,
        //   labelTextStyle: MaterialStateProperty.all(
        //     const TextStyle(
        //       color: Colors.white,
              
        //     ),
        //   ),
        //   iconTheme: MaterialStateProperty.all(
        //     const IconThemeData(color: Colors.white),
        //   ),
        // ),
      );
}

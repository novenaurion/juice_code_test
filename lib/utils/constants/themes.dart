import 'package:flutter/material.dart';
import 'package:juice_code_test/utils/constants/colors.dart';

class AppThemes {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: AppColors.primaryColor,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white,fontSize: 16)
        ),
        fontFamily: 'Poppin',
        scaffoldBackgroundColor: Colors.white,
      );
}

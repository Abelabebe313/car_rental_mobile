import 'package:car_rental_app/core/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData appThemeData(BuildContext context) {
  return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: ThemeColors.primary,
      dialogTheme: DialogTheme(
        surfaceTintColor: ThemeColors.backgroundColor,
        backgroundColor: ThemeColors.backgroundColor,
      ),
      datePickerTheme: DatePickerThemeData(
        backgroundColor: ThemeColors.backgroundColor,
        headerBackgroundColor: ThemeColors.backgroundColor,
        dividerColor: ThemeColors.backgroundColor,
        shadowColor: ThemeColors.backgroundColor,
        surfaceTintColor: ThemeColors.backgroundColor,
        todayBorder: BorderSide(color: ThemeColors.primary, width: 1),
        todayBackgroundColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.selected)
                ? ThemeColors.primary
                : ThemeColors.backgroundColor),
        dayBackgroundColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.selected)
                ? ThemeColors.primary
                : ThemeColors.backgroundColor),
        rangeSelectionBackgroundColor: ThemeColors.backgroundColor,
      ),
      timePickerTheme: TimePickerThemeData(
        hourMinuteTextStyle: GoogleFonts.inter(fontSize: 30),
        backgroundColor: ThemeColors.backgroundColor,
        hourMinuteColor: ThemeColors.primary,
        hourMinuteTextColor: Colors.white,
        dialBackgroundColor: ThemeColors.lightPrimary,
        dialHandColor: ThemeColors.primary,
        dayPeriodTextColor: Colors.white,
        dayPeriodColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.selected)
                ? ThemeColors.primary
                : ThemeColors.lightPrimary),
        // dayPeriodColor: ThemeColors.primary,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: ThemeColors.backgroundColor,
      ),
      appBarTheme: const AppBarTheme(scrolledUnderElevation: 0),
      textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedLabelStyle: GoogleFonts.inter(),
          unselectedLabelStyle: GoogleFonts.inter()));
}

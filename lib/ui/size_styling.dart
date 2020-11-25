import 'size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

class AppStyles {
  static final TextStyle appBarTitle = GoogleFonts.sansita(
    fontSize: SizeConfig.textMultiplier * 5.5,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static final TextStyle titleStyle = GoogleFonts.caveat(
    color: secondaryColor,
    fontSize: AppStyles.titleCardSize,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle titleStyleAlternativeColor = GoogleFonts.caveat(
    color: primaryColor,
    fontSize: AppStyles.titleCardSize,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle fieldStyle = GoogleFonts.sansita(
    fontSize: SizeConfig.textMultiplier * 3,
    fontWeight: FontWeight.bold,
  );

  static final TextStyle dateFieldStyle = GoogleFonts.sansita(
    fontSize: SizeConfig.textMultiplier * 2.3,
  );

  static InputDecoration textFieldStyle(label) {
    return InputDecoration(
      helperText: ' ',
      helperStyle: TextStyle(fontSize: 16),
      errorStyle: TextStyle(fontSize: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryColor, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      fillColor: Colors.white,
      filled: true,
      labelText: label,
      labelStyle:
          TextStyle(color: primaryColor, fontSize: 20, letterSpacing: 2),
    );
  }

  static final double bigPadding = SizeConfig.imageSizeMultiplier * 40;

  static final double mediumPadding = SizeConfig.textMultiplier * 8;

  static final double smallPadding = SizeConfig.textMultiplier * 2;

  static final double appBarHeight = SizeConfig.textMultiplier * 15;

  static final double buttonWidth = SizeConfig.imageSizeMultiplier * 45;

  static final double buttonText = SizeConfig.textMultiplier * 2.5;

  static final double iconCardSize = SizeConfig.textMultiplier * 3.5;

  static final double titleCardSize = SizeConfig.textMultiplier * 5;

  static final double imageCardSize = SizeConfig.imageSizeMultiplier * 70;

  static final double arrowBackIcon = SizeConfig.textMultiplier * 7;
}

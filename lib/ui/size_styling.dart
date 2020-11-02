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

  static final double bigPadding = SizeConfig.imageSizeMultiplier * 40;

  static final double mediumPadding = SizeConfig.textMultiplier * 8;

  static final double smallPadding = SizeConfig.textMultiplier * 2.5;

  static final double appBarHeight = SizeConfig.textMultiplier * 15;

  static final double buttonWidth = SizeConfig.imageSizeMultiplier * 45;

  static final double buttonText = SizeConfig.textMultiplier * 2.5;

  static final double iconCardSize = SizeConfig.textMultiplier * 3.5;

  static final double titleCardSize = SizeConfig.textMultiplier * 5;

  static final double imageCardSize = SizeConfig.imageSizeMultiplier * 70;

  static final double arrowBackIcon = SizeConfig.textMultiplier * 7;
}

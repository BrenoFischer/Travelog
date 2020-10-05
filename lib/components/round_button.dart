import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travelog/constants.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key key,
      this.onPress,
      this.text,
      this.style,
      this.size,
      this.width,
      this.fontSize})
      : super(key: key);

  final VoidCallback onPress;
  final String text;
  final bool style;
  final double size;
  final double width;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final Color color = style ? secondaryColor : primaryColor;
    return Container(
      width: width,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: color),
        ),
        color: style ? color : Colors.white,
        padding: EdgeInsets.all(size),
        textColor: style ? Colors.white : color,
        onPressed: onPress,
        child: Text(
          text,
          style: GoogleFonts.sansita(
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

import 'package:axon_vision/utils/app_colors.dart';
import 'package:axon_vision/utils/enums.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PoppinsTextView extends StatelessWidget {
  // constructor
  const PoppinsTextView({
    super.key,
    required this.value,
    this.color,
    this.size,
    this.fontStyle,
    this.fontWeight,
    this.alignText,
    this.overFlow,
    this.textDecoration,
    this.decorationColor,
  });

  final String value;
  final Color? color;
  final double? size;
  final FontStyle? fontStyle;
  final FontWeight? fontWeight;
  final AlignTextType? alignText;
  final TextOverflow? overFlow;
  final TextDecoration? textDecoration;
  final Color? decorationColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      overflow: overFlow,
      style: GoogleFonts.poppins(
        decoration: textDecoration,
        decorationColor: decorationColor,
        color: color ?? AppColors.black,
        fontSize: size ?? SizeConfig.safeBlockHorizontal * 4,
        fontStyle: fontStyle ?? FontStyle.normal,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: alignText == AlignTextType.center
          ? TextAlign.center
          : alignText == AlignTextType.right
          ? TextAlign.right
          : TextAlign.left,
    );
  }
}

class PoppinsStyle {
  TextStyle labelStyle() {
    return GoogleFonts.poppins(
      color: Colors.white,
      fontSize: SizeConfig.safeBlockHorizontal * 1.1,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle dropdownStyle() {
    return GoogleFonts.poppins(
      color: Colors.white,
      fontSize: SizeConfig.safeBlockHorizontal * 1.2,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textfieldStyle() {
    return GoogleFonts.poppins(
      color: Colors.black,
      fontSize: SizeConfig.safeBlockHorizontal * 0.8,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle unSelectedStyle() {
    return GoogleFonts.poppins(
      color: Colors.black54,
      fontSize: SizeConfig.safeBlockHorizontal * 1,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
    );
  }
}

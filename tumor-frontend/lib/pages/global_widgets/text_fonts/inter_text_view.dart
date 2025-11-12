import 'package:axon_vision/utils/app_colors.dart';
import 'package:axon_vision/utils/enums.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InterTextView extends StatelessWidget {
  // constructor
  const InterTextView({
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
      style: GoogleFonts.inter(
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

class InterStyle {
  final Color? textHintColor;
  final double? hintTextSize;
  final FontWeight? fontWeightHintText;
  InterStyle({this.hintTextSize, this.textHintColor, this.fontWeightHintText});
  TextStyle labelStyle() {
    return GoogleFonts.poppins(
      color: textHintColor ?? Colors.grey,
      fontSize: hintTextSize ?? SizeConfig.safeBlockHorizontal * 1.1,
      fontStyle: FontStyle.normal,
      fontWeight: fontWeightHintText ?? FontWeight.bold,
    );
  }

  TextStyle dropdownStyle() {
    return GoogleFonts.inter(
      color: Colors.white,
      fontSize: SizeConfig.safeBlockHorizontal * 1.2,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle textfieldStyle() {
    return GoogleFonts.inter(
      color: Colors.black,
      fontSize: SizeConfig.safeBlockHorizontal * 0.8,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle unSelectedStyle() {
    return GoogleFonts.inter(
      color: Colors.black54,
      fontSize: SizeConfig.safeBlockHorizontal * 1,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
    );
  }
}

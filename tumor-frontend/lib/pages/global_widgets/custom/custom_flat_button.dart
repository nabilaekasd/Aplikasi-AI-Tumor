import 'package:axon_vision/utils/app_colors.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_ripple_button.dart';

class CustomFlatButton extends StatelessWidget {
  const CustomFlatButton({
    super.key,
    this.textColor,
    this.textColorLoading,
    this.backgroundColor,
    this.borderColor,
    this.colorIconImage,
    this.textSize,
    this.height,
    this.width,
    this.iconSize,
    this.radius,
    this.image,
    this.icon,
    required this.text,
    this.subText = '',
    this.loading = false,
    this.gradientColor,
    required this.onTap,
  });

  //Color
  final Color? textColor;
  final Color? textColorLoading;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? colorIconImage;
  //Double
  final double? textSize;
  final double? height;
  final double? width;
  final double? iconSize;
  final double? radius;
  //String
  final String? image;
  final IconData? icon;
  final String text;
  final String subText;
  //Other
  final bool loading;
  final Gradient? gradientColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? SizeConfig.safeBlockHorizontal * 16,
      height: height ?? SizeConfig.safeBlockVertical * 8,
      decoration: BoxDecoration(
        border: loading
            ? null
            : Border.all(color: borderColor ?? backgroundColor ?? Colors.white),
        gradient: loading ? null : gradientColor,
        borderRadius: BorderRadius.circular(SizeConfig.horizontal(radius ?? 3)),
        color: loading
            ? AppColors.greyDisabled
            : backgroundColor ?? AppColors.bgSecondColor,
      ),
      child: CustomRippleButton(
        onTap: () {
          loading ? _emptyAction() : onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (loading) const SizedBox.shrink() else _buildWrapper(),
            if (loading)
              SizedBox(
                width: SizeConfig.horizontal(5),
                height: SizeConfig.horizontal(5),
                child: const CircularProgressIndicator(),
              )
            else
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (text == '')
                    const SizedBox.shrink()
                  else
                    Text(
                      text,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize:
                            textSize ?? SizeConfig.safeBlockHorizontal * 1.5,
                        color: loading
                            ? textColorLoading ?? AppColors.white
                            : textColor ?? Colors.white,
                      ),
                    ),
                  if (subText == '')
                    const SizedBox.shrink()
                  else
                    text == ''
                        ? const SizedBox.shrink()
                        : Text(
                            subText,
                            style: GoogleFonts.nunito(
                              fontSize: SizeConfig.horizontal(textSize ?? 3),
                              color: loading
                                  ? textColorLoading ?? AppColors.white
                                  : textColor ?? Colors.white,
                            ),
                          ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildWrapper() {
    return Builder(
      builder: (_) {
        if (image != null) {
          return Container(
            margin: EdgeInsets.only(right: SizeConfig.horizontal(2)),
            child: Image.asset(
              image!,
              height: SizeConfig.vertical(iconSize ?? 4),
              color: colorIconImage,
            ),
          );
        } else if (icon != null) {
          return Icon(icon, color: colorIconImage, size: iconSize);
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  dynamic _emptyAction() {
    return null;
  }
}

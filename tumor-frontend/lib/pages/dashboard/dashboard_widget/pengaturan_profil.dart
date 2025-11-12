import 'package:axon_vision/pages/global_widgets/custom/custom_flat_button.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_ripple_button.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_text_field.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_text_password_field.dart';
import 'package:axon_vision/pages/global_widgets/text_fonts/poppins_text_view.dart';
import 'package:axon_vision/utils/app_colors.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:axon_vision/utils/space_sizer.dart';
import 'package:flutter/material.dart';

class PengaturanProfil extends StatelessWidget {
  const PengaturanProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PoppinsTextView(
          value: 'Pengaturan Profil',
          size: SizeConfig.safeBlockHorizontal * 1.2,
          fontWeight: FontWeight.bold,
        ),
        PoppinsTextView(
          value: 'Kelola informasi akun dan keamanan Anda.',
          size: SizeConfig.safeBlockHorizontal * 1.2,
          fontWeight: FontWeight.bold,
        ),
        SpaceSizer(vertical: 1),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.horizontal(1.5)),
                ),
              ),
              width: SizeConfig.safeBlockHorizontal * 70,
              height: SizeConfig.safeBlockVertical * 35,
              child: Padding(
                padding: EdgeInsets.all(SizeConfig.horizontal(1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PoppinsTextView(
                      value: 'Informasi Profil',
                      size: SizeConfig.safeBlockHorizontal * 1,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        SpaceSizer(horizontal: 1.5),
                        CustomRippleButton(
                          onTap: () {
                            //upload action
                          },
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.bgColor,
                                  shape: BoxShape.circle,
                                ),

                                width: SizeConfig.safeBlockHorizontal * 7,
                                height: SizeConfig.safeBlockVertical * 7,
                                child: Icon(
                                  Icons.person_2_sharp,
                                  size: SizeConfig.safeBlockHorizontal * 3,
                                ),
                              ),
                              PoppinsTextView(
                                value: 'Ubah Foto',
                                size: SizeConfig.safeBlockHorizontal * 1,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    Row(
                      children: [
                        PoppinsTextView(
                          value: 'Nama Lengkap:',
                          size: SizeConfig.safeBlockHorizontal * 1,
                        ),
                        SpaceSizer(horizontal: 0.5),
                        CustomTextField(
                          width: 14,
                          height: SizeConfig.vertical(4),
                          fillColor: AppColors.white,
                          title: '',
                          titleFontWeight: FontWeight.bold,
                          hintTextColor: AppColors.black,
                          hintTextFontweight: FontWeight.w500,
                          hintTextSize: SizeConfig.safeBlockHorizontal * 1,
                        ),
                      ],
                    ),
                    SpaceSizer(vertical: 2),
                    Row(
                      children: [
                        PoppinsTextView(
                          value: 'Username:',
                          size: SizeConfig.safeBlockHorizontal * 1,
                        ),
                        SpaceSizer(horizontal: 2.9),
                        CustomTextField(
                          width: 14,
                          height: SizeConfig.vertical(4),
                          fillColor: AppColors.white,
                          title: '',
                          titleFontWeight: FontWeight.bold,
                          hintTextColor: AppColors.black,
                          hintTextFontweight: FontWeight.w500,
                          hintTextSize: SizeConfig.safeBlockHorizontal * 1,
                        ),
                      ],
                    ),
                    SpaceSizer(vertical: 2),
                    Row(
                      children: [
                        PoppinsTextView(
                          value: 'Spesialis:',
                          size: SizeConfig.safeBlockHorizontal * 1,
                        ),
                        SpaceSizer(horizontal: 3.7),
                        CustomTextField(
                          width: 14,
                          height: SizeConfig.vertical(4),
                          fillColor: AppColors.white,
                          title: '',
                          titleFontWeight: FontWeight.bold,
                          hintTextColor: AppColors.black,
                          hintTextFontweight: FontWeight.w500,
                          hintTextSize: SizeConfig.safeBlockHorizontal * 1,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SpaceSizer(vertical: 1.5),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(SizeConfig.horizontal(1.5)),
            ),
          ),
          width: SizeConfig.safeBlockHorizontal * 70,
          height: SizeConfig.safeBlockVertical * 26,
          child: Padding(
            padding: EdgeInsets.all(SizeConfig.horizontal(1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PoppinsTextView(
                  value: 'Ubah Password',
                  size: SizeConfig.safeBlockHorizontal * 1,
                  fontWeight: FontWeight.bold,
                ),
                SpaceSizer(vertical: 1.5),
                Row(
                  children: [
                    PoppinsTextView(
                      value: 'Password Saat Ini:',
                      size: SizeConfig.safeBlockHorizontal * 1,
                    ),
                    SpaceSizer(horizontal: 5.1),
                    CustomTextPasswordField(
                      iconSize: SizeConfig.safeBlockHorizontal * 1,
                      fillColor: AppColors.white,
                      width: 14,
                      height: SizeConfig.vertical(4),
                      title: '',
                      titleFontWeight: FontWeight.bold,
                      hintTextColor: AppColors.black,
                    ),
                  ],
                ),
                SpaceSizer(vertical: 2),
                Row(
                  children: [
                    PoppinsTextView(
                      value: 'Password Baru:',
                      size: SizeConfig.safeBlockHorizontal * 1,
                    ),
                    SpaceSizer(horizontal: 6.5),
                    CustomTextPasswordField(
                      iconSize: SizeConfig.safeBlockHorizontal * 1,
                      fillColor: AppColors.white,
                      width: 14,
                      height: SizeConfig.vertical(4),
                      title: '',
                      titleFontWeight: FontWeight.bold,
                      hintTextColor: AppColors.black,
                    ),
                  ],
                ),
                SpaceSizer(vertical: 2),
                Row(
                  children: [
                    PoppinsTextView(
                      value: 'Konfirmasi Password Baru:',
                      size: SizeConfig.safeBlockHorizontal * 1,
                    ),
                    SpaceSizer(horizontal: 1),
                    CustomTextPasswordField(
                      iconSize: SizeConfig.safeBlockHorizontal * 1,
                      fillColor: AppColors.white,
                      width: 14,
                      height: SizeConfig.vertical(4),
                      title: '',
                      titleFontWeight: FontWeight.bold,
                      hintTextColor: AppColors.black,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SpaceSizer(vertical: 1),
        Row(
          children: [
            SpaceSizer(horizontal: 50),
            CustomFlatButton(
              text: 'Simpan Perubahan',
              onTap: () {},
              radius: 0.5,
              width: SizeConfig.blockSizeHorizontal * 20,
              height: SizeConfig.blockSizeHorizontal * 3,
              backgroundColor: AppColors.bgColor,
              colorIconImage: AppColors.white,
              textSize: SizeConfig.safeBlockHorizontal * 1.2, //lanjut
            ),
          ],
        ),
        SpaceSizer(vertical: 10),
      ],
    );
  }
}

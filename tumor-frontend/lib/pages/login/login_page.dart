import 'package:axon_vision/controllers/login_controller.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_flat_button.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_text_field.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_text_password_field.dart';
import 'package:axon_vision/pages/global_widgets/frame/frame_scaffold.dart';
import 'package:axon_vision/pages/global_widgets/text_fonts/poppins_text_view.dart';
import 'package:axon_vision/routes/app_route.dart';
import 'package:axon_vision/utils/app_colors.dart';
import 'package:axon_vision/utils/asset_list.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:axon_vision/utils/space_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return FrameScaffold(
      heightBar: 0,
      elevation: 0,
      color: AppColors.black,
      statusBarColor: AppColors.black,
      colorScaffold: AppColors.white,
      statusBarBrightness: Brightness.light,
      view: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController loginController) => Row(
          children: [
            Expanded(
              flex: 6,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.blueDark,
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://img.freepik.com/free-photo/rendering-smart-home-device_23-2151039302.jpg?t=st=1716353000~exp=1716356600~hmac=example',
                    ),
                    fit: BoxFit.cover,
                    opacity: 0.4,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.blueDark.withValues(alpha: 0.8),
                        AppColors.bgColor.withValues(alpha: 0.9),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.all(SizeConfig.horizontal(4)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AssetList.axonLogo,
                        width: SizeConfig.safeBlockHorizontal * 10,
                        color: Colors.white,
                      ),
                      SpaceSizer(vertical: 2),
                      PoppinsTextView(
                        value: 'Sistem Deteksi\nTumor Otak',
                        size: SizeConfig.safeBlockHorizontal * 2.5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      SpaceSizer(vertical: 2),

                      PoppinsTextView(
                        value:
                            'Mendukung profesional medis dalam memberikan diagnosis.',
                        size: SizeConfig.safeBlockHorizontal * 1.0,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                color: AppColors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.horizontal(6),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PoppinsTextView(
                          value: 'Selamat Datang Kembali!👋',
                          size: SizeConfig.safeBlockHorizontal * 1.8,
                          fontWeight: FontWeight.bold,
                          color: AppColors.black,
                        ),
                        SpaceSizer(vertical: 1),
                        PoppinsTextView(
                          value: 'Silakan masukkan kredensial Anda.',
                          size: SizeConfig.safeBlockHorizontal * 0.9,
                          color: AppColors.grey,
                        ),
                        SpaceSizer(vertical: 2),

                        // Form Username
                        CustomTextField(
                          title: 'Username/Email',
                          titleFontWeight: FontWeight.w600,
                          width: 100,
                          hintText: 'Masukkan Username',
                          fillColor: AppColors.white,
                          borderRadius: 0.8,
                        ),
                        SpaceSizer(vertical: 2),

                        //Form Password
                        CustomTextPasswordField(
                          width: 100,
                          title: 'Password',
                          titleFontWeight: FontWeight.w600,
                          isPasswordField: true,
                          hintText: 'Masukkan Password',
                          fillColor: AppColors.white,
                          borderRadius: 0.8,
                        ),

                        SpaceSizer(vertical: 1.5),

                        // Lupa Password
                        Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {},
                            child: PoppinsTextView(
                              value: 'Lupa Password?',
                              color: AppColors.blueColor,
                              fontWeight: FontWeight.bold,
                              size: SizeConfig.safeBlockHorizontal * 0.8,
                            ),
                          ),
                        ),
                        SpaceSizer(vertical: 3),

                        // Tombol Login
                        CustomFlatButton(
                          width: double.infinity,
                          height: SizeConfig.safeBlockVertical * 6,
                          text: 'Masuk ke Dashboard',
                          radius: 0.8,
                          onTap: () {
                            router.replaceNamed('dashboard');
                          },
                          backgroundColor: AppColors.bgColor,
                          textColor: Colors.white,
                          textSize: SizeConfig.safeBlockHorizontal * 1.0,
                        ),
                        SpaceSizer(vertical: 4),

                        Center(
                          child: PoppinsTextView(
                            value: '© 2025 Axon Vision. All Rights Reserved.',
                            size: SizeConfig.safeBlockHorizontal * 0.7,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

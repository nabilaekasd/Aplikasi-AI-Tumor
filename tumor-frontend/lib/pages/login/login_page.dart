import 'package:axon_vision/controllers/login_controller.dart';
import 'package:axon_vision/pages/dashboard/dashboard_page.dart';
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
      colorScaffold: AppColors.bgColor,
      statusBarBrightness: Brightness.light,
      view: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (LoginController loginController) => Center(
          child: Container(
            width: SizeConfig.safeBlockHorizontal * 40,
            height: SizeConfig.safeBlockVertical * 80,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.safeBlockHorizontal * 2.5),
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  AssetList.axonLogo,
                  fit: BoxFit.cover,
                  width: SizeConfig.safeBlockHorizontal * 30,
                  height: SizeConfig.safeBlockVertical * 26,
                ),

                PoppinsTextView(
                  value: 'Silahkan login dengan akun anda',
                  size: SizeConfig.safeBlockHorizontal * 1.3,
                ),
                SpaceSizer(vertical: 8),
                CustomTextField(
                  title: '',
                  width: 30,
                  hintText: 'Username',
                  borderRadius: 20,
                ),
                SpaceSizer(vertical: 2),
                CustomTextPasswordField(
                  width: 30,
                  title: '',
                  isPasswordField: true,
                  hintText: 'Password',
                  borderRadius: 20,
                ),
                SpaceSizer(vertical: 2),
                Padding(
                  padding: EdgeInsets.only(left: SizeConfig.horizontal(6)),
                  child: Row(
                    children: [
                      PoppinsTextView(
                        value: 'Lupa Password? ',
                        size: SizeConfig.safeBlockHorizontal * 1.2,
                      ),
                      PoppinsTextView(
                        value: 'Hubungi Adminstrator',
                        textDecoration: TextDecoration.underline,
                        color: AppColors.blueColor,
                        size: SizeConfig.safeBlockHorizontal * 1.2,
                      ),
                    ],
                  ),
                ),
                SpaceSizer(vertical: 3),
                CustomFlatButton(
                  width: SizeConfig.safeBlockHorizontal * 16,
                  text: 'Login',
                  onTap: () {
                    router.replaceNamed('dashboard');
                  },
                  backgroundColor: AppColors.blueDark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

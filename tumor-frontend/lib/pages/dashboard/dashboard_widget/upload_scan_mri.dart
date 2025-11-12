import 'package:axon_vision/controllers/dashboard_controller.dart';
import 'package:axon_vision/models/data_pasien_model.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_flat_button.dart';
import 'package:axon_vision/pages/global_widgets/text_fonts/poppins_text_view.dart';
import 'package:axon_vision/utils/app_colors.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:axon_vision/utils/space_sizer.dart';
import 'package:flutter/material.dart';

class UploadScanMri extends StatelessWidget {
  final DataPasienModel pasienData;
  final VoidCallback onBack;
  final DashboardController dashboardController;
  const UploadScanMri({
    super.key,
    required this.pasienData,
    required this.onBack,
    required this.dashboardController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PoppinsTextView(
          value: 'Upload Scan MRI Baru',
          size: SizeConfig.safeBlockHorizontal * 1.2,
          fontWeight: FontWeight.bold,
        ),
        PoppinsTextView(
          value: 'Untuk Pasien: ${pasienData.namePatient}',
          size: SizeConfig.safeBlockHorizontal * 1.2,
          fontWeight: FontWeight.bold,
        ),
        SpaceSizer(vertical: 5),
        Row(
          children: [
            SpaceSizer(horizontal: 14),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.horizontal(1.5)),
                ),
                color: AppColors.greyDisabled,
              ),
              width: SizeConfig.safeBlockHorizontal * 40,
              height: SizeConfig.safeBlockVertical * 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.upload, size: SizeConfig.safeBlockHorizontal * 10),
                  PoppinsTextView(
                    value: 'Seret dan letakkan file di sini',
                    size: SizeConfig.safeBlockHorizontal * 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                  PoppinsTextView(
                    value: 'atau',
                    size: SizeConfig.safeBlockHorizontal * 1.2,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomFlatButton(
                    text: 'Pilih File',
                    onTap: () {},
                    radius: 0.5,
                    width: SizeConfig.blockSizeHorizontal * 9,
                    height: SizeConfig.blockSizeHorizontal * 2,
                    backgroundColor: AppColors.bgColor,
                    icon: Icons.add,
                    colorIconImage: AppColors.white,
                    textSize: SizeConfig.safeBlockHorizontal * 1.2,
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            SpaceSizer(horizontal: 14),
            PoppinsTextView(
              value: 'Format: .dcm, .nii. Ukuran maks: 500MB',
              size: SizeConfig.safeBlockHorizontal * 0.8,
            ),
          ],
        ),
        SpaceSizer(vertical: 6),
        Row(
          children: [
            SpaceSizer(horizontal: 19),
            CustomFlatButton(
              text: 'Batal',
              onTap: () {},
              radius: 1,
              width: SizeConfig.blockSizeHorizontal * 10,
              height: SizeConfig.blockSizeHorizontal * 3,
              backgroundColor: AppColors.greyDisabled,
              colorIconImage: AppColors.white,
              textColor: AppColors.black,
              textSize: SizeConfig.safeBlockHorizontal * 1.2,
            ),
            SpaceSizer(horizontal: 1),
            CustomFlatButton(
              text: 'Upload dan Mulai Analisis',
              onTap: () {
                dashboardController.changeMenu(4);
              },
              radius: 1,
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

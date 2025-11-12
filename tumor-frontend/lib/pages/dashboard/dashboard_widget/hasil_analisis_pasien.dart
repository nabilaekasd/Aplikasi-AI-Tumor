import 'package:axon_vision/controllers/dashboard_controller.dart';
import 'package:axon_vision/models/data_pasien_model.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_flat_button.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_text_field.dart';
import 'package:axon_vision/pages/global_widgets/text_fonts/poppins_text_view.dart';
import 'package:axon_vision/utils/app_colors.dart';
import 'package:axon_vision/utils/asset_list.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:axon_vision/utils/space_sizer.dart';
import 'package:flutter/material.dart';

class HasilAnalisisPasien extends StatelessWidget {
  final DataPasienModel pasienData;
  final VoidCallback onBack;
  final DashboardController dashboardController;
  const HasilAnalisisPasien({
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
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
                borderRadius: BorderRadius.all(
                  Radius.circular(SizeConfig.horizontal(1.5)),
                ),
              ),
              width: SizeConfig.safeBlockHorizontal * 45,
              height: SizeConfig.safeBlockVertical * 70,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.horizontal(1),
                  vertical: SizeConfig.vertical(8),
                ),
                child: Container(
                  color: AppColors.redAlert,
                  child: Image.asset(AssetList.axonLogo),
                ),
              ),
            ),
            SpaceSizer(horizontal: 1),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                    borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.horizontal(1.5)),
                    ),
                  ),
                  width: SizeConfig.safeBlockHorizontal * 24,
                  height: SizeConfig.safeBlockVertical * 17,
                  child: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.horizontal(1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpaceSizer(vertical: 3),
                        PoppinsTextView(
                          value: 'Info Pasien',
                          size: SizeConfig.safeBlockHorizontal * 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        SpaceSizer(vertical: 3),
                        PoppinsTextView(
                          value: 'Nama: ${pasienData.namePatient}',
                          size: SizeConfig.safeBlockHorizontal * 1,
                        ),
                        PoppinsTextView(
                          value: 'Tanggal Scan: DD/MM/YYYY',
                          size: SizeConfig.safeBlockHorizontal * 1,
                        ),
                      ],
                    ),
                  ),
                ),
                SpaceSizer(vertical: 1),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                    borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.horizontal(1.5)),
                    ),
                  ),
                  width: SizeConfig.safeBlockHorizontal * 24,
                  height: SizeConfig.safeBlockVertical * 17,
                  child: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.horizontal(1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpaceSizer(vertical: 3),
                        PoppinsTextView(
                          value: 'Hasil Analisis AI',
                          size: SizeConfig.safeBlockHorizontal * 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        SpaceSizer(vertical: 3),
                        PoppinsTextView(
                          value: 'Prediksi: ',
                          size: SizeConfig.safeBlockHorizontal * 1,
                        ),
                        PoppinsTextView(
                          value: 'Akurasi: %',
                          size: SizeConfig.safeBlockHorizontal * 1,
                        ),
                      ],
                    ),
                  ),
                ),
                SpaceSizer(vertical: 1),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                    borderRadius: BorderRadius.all(
                      Radius.circular(SizeConfig.horizontal(1.5)),
                    ),
                  ),
                  width: SizeConfig.safeBlockHorizontal * 24,
                  height: SizeConfig.safeBlockVertical * 20,
                  child: Padding(
                    padding: EdgeInsets.only(left: SizeConfig.horizontal(1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SpaceSizer(vertical: 3),
                        PoppinsTextView(
                          value: 'Kontrol Tampilan',
                          size: SizeConfig.safeBlockHorizontal * 1.2,
                          fontWeight: FontWeight.bold,
                        ),
                        SpaceSizer(vertical: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomFlatButton(
                              text: '3D',
                              onTap: () {},
                              radius: 1,
                              width: SizeConfig.blockSizeHorizontal * 8,
                              height: SizeConfig.blockSizeHorizontal * 3,
                              backgroundColor: AppColors.bgColor,
                              textColor: AppColors.white,
                              textSize: SizeConfig.safeBlockHorizontal * 1.2,
                            ),
                            SpaceSizer(horizontal: 1),
                            CustomFlatButton(
                              text: '2D',
                              onTap: () {},
                              radius: 1,
                              width: SizeConfig.blockSizeHorizontal * 8,
                              height: SizeConfig.blockSizeHorizontal * 3,
                              backgroundColor: AppColors.bgColor,
                              colorIconImage: AppColors.white,
                              textSize:
                                  SizeConfig.safeBlockHorizontal * 1.2, //lanjut
                            ),
                          ],
                        ),
                        SpaceSizer(vertical: 2),
                      ],
                    ),
                  ),
                ),
                SpaceSizer(vertical: 3),

                CustomTextField(
                  width: 24,
                  fillColor: AppColors.white,
                  title: 'Catatan Dokter',
                  titleFontWeight: FontWeight.bold,
                  textSize: SizeConfig.safeBlockHorizontal * 1.2,
                  hintText: 'Tulis catatan dokter disini',
                  hintTextColor: AppColors.black,
                  hintTextFontweight: FontWeight.w500,
                  hintTextSize: SizeConfig.safeBlockHorizontal * 1,
                ),
              ],
            ),
          ],
        ),

        SpaceSizer(vertical: 1),
        Row(
          children: [
            SpaceSizer(horizontal: 49),
            CustomFlatButton(
              text: 'Simpan',
              onTap: () {},
              radius: 1,
              width: SizeConfig.blockSizeHorizontal * 10,
              height: SizeConfig.blockSizeHorizontal * 3,
              backgroundColor: AppColors.bgColor,
              textColor: AppColors.white,
              textSize: SizeConfig.safeBlockHorizontal * 1.2,
            ),
            SpaceSizer(horizontal: 1),
            CustomFlatButton(
              text: 'Kembali',
              onTap: () {},
              radius: 1,
              width: SizeConfig.blockSizeHorizontal * 10,
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

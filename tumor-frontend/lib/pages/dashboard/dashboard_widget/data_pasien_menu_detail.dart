import 'package:axon_vision/controllers/dashboard_controller.dart';
import 'package:axon_vision/models/data_pasien_model.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_flat_button.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_ripple_button.dart';
import 'package:axon_vision/pages/global_widgets/text_fonts/poppins_text_view.dart';
import 'package:axon_vision/utils/app_colors.dart';
import 'package:axon_vision/utils/asset_list.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:axon_vision/utils/space_sizer.dart';
import 'package:flutter/material.dart';

class DataPasienMenuDetail extends StatelessWidget {
  final DataPasienModel pasienData;
  final VoidCallback onBack;
  final DashboardController dashboardController;
  const DataPasienMenuDetail({
    super.key,
    required this.pasienData,
    required this.onBack,
    required this.dashboardController,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRippleButton(
            onTap: () {
              onBack();
            },
            child: PoppinsTextView(
              value: '< Data Pasien /${pasienData.namePatient}',
              color: AppColors.grey,
              size: SizeConfig.safeBlockHorizontal * 1.2,
            ),
          ),

          SpaceSizer(vertical: 3),

          PoppinsTextView(
            value: 'Nama Pasien: ${pasienData.namePatient}',
            size: SizeConfig.safeBlockHorizontal * 1.2,
          ),
          SpaceSizer(vertical: 1),

          Row(
            children: [
              PoppinsTextView(
                value: 'Tgl Lahir: ${pasienData.tanggalLahir}',
                size: SizeConfig.safeBlockHorizontal * 1.2,
              ),
              SpaceSizer(horizontal: 40),

              PoppinsTextView(
                value: 'Status: Aktif',
                size: SizeConfig.safeBlockHorizontal * 1.2,
              ),
            ],
          ),
          SpaceSizer(vertical: 2),
          Row(
            children: [
              SpaceSizer(horizontal: 60),
              CustomFlatButton(
                text: 'Upload MRI',
                onTap: () {
                  dashboardController.changeMenu(3);
                },
                radius: 1,
                width: SizeConfig.blockSizeHorizontal * 10,
                height: SizeConfig.blockSizeHorizontal * 3,
                backgroundColor: AppColors.bgColor,
                icon: Icons.add,
                colorIconImage: AppColors.white,
                textSize: SizeConfig.safeBlockHorizontal * 1.2,
              ),
            ],
          ),
          SpaceSizer(vertical: 2),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 74,
            child: Divider(
              height: SizeConfig.safeBlockHorizontal * 0.2,
              thickness: 1,
              indent: 6,
              endIndent: 60,
              color: AppColors.greyDisabled,
            ),
          ),
          SpaceSizer(vertical: 2),
          Row(
            children: [
              CustomFlatButton(
                text: 'Riwayat Scan',
                onTap: () {},
                radius: 1,
                width: SizeConfig.blockSizeHorizontal * 10,
                height: SizeConfig.blockSizeHorizontal * 3,
                backgroundColor: AppColors.bgColor,
                colorIconImage: AppColors.white,
                textSize: SizeConfig.safeBlockHorizontal * 1.2,
              ),
              SpaceSizer(horizontal: 1),
              CustomFlatButton(
                text: 'Informasi Demografis',
                onTap: () {},
                radius: 1,
                width: SizeConfig.blockSizeHorizontal * 15,
                height: SizeConfig.blockSizeHorizontal * 3,
                backgroundColor: AppColors.greyDisabled,
                colorIconImage: AppColors.white,
                textColor: AppColors.black,
                textSize: SizeConfig.safeBlockHorizontal * 1.2,
              ),
            ],
          ),
          SpaceSizer(vertical: 2),
          Row(
            children: [
              PoppinsTextView(
                value: 'Urutkan: ',
                size: SizeConfig.safeBlockHorizontal * 1.2,
              ),
              SpaceSizer(horizontal: 1),
              CustomFlatButton(
                text: 'Tanggal Terbaru',
                onTap: () {},
                radius: 0.2,
                width: SizeConfig.blockSizeHorizontal * 12,
                height: SizeConfig.blockSizeHorizontal * 3,
                backgroundColor: AppColors.white,
                textColor: AppColors.black,
                borderColor: AppColors.black,
                textSize: SizeConfig.safeBlockHorizontal * 1,
                icon: Icons.arrow_downward,
              ),
            ],
          ),
          SpaceSizer(vertical: 2),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 70,
            height: SizeConfig.safeBlockVertical * 60,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 50,
                mainAxisSpacing: 10,
                childAspectRatio: 32 / 12,
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.black),
                  borderRadius: BorderRadius.all(
                    Radius.circular(SizeConfig.horizontal(2)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(SizeConfig.horizontal(2)),
                        ),
                      ),
                      child: Column(
                        children: [
                          SpaceSizer(vertical: 2),
                          Row(
                            children: [
                              SpaceSizer(horizontal: 2),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.redAlert,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(SizeConfig.horizontal(0.5)),
                                  ),
                                ),
                                width: SizeConfig.safeBlockHorizontal * 11,
                                height: SizeConfig.safeBlockVertical * 15,
                                child: Image.asset(AssetList.axonLogo),
                              ),
                              SpaceSizer(horizontal: 1),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: SizeConfig.horizontal(1),
                                children: [
                                  PoppinsTextView(
                                    value: 'Tanggal Scan: ',
                                    size: SizeConfig.safeBlockHorizontal * 0.8,
                                  ),
                                  PoppinsTextView(
                                    value: 'Hasil Prediksi: ',
                                    size: SizeConfig.safeBlockHorizontal * 0.8,
                                  ),
                                  PoppinsTextView(
                                    value: 'Status: ',
                                    size: SizeConfig.safeBlockHorizontal * 0.8,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SpaceSizer(horizontal: 20),
                              CustomFlatButton(
                                text: 'Lihat Analisis Detail',
                                onTap: () {},
                                radius: 0.5,
                                width: SizeConfig.blockSizeHorizontal * 11,
                                height: SizeConfig.blockSizeHorizontal * 2.5,
                                backgroundColor: AppColors.greyDisabled,
                                colorIconImage: AppColors.white,
                                textColor: AppColors.black,
                                textSize: SizeConfig.safeBlockHorizontal * 1,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

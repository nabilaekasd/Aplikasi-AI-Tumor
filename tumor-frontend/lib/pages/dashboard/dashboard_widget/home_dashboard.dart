import 'package:axon_vision/controllers/dashboard_controller.dart';
import 'package:axon_vision/pages/dashboard/dashboard_widget/dashboard_tabel_analisis.dart';
import 'package:axon_vision/pages/dashboard/dashboard_widget/dashboard_tabel_data_pasien.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_flat_button.dart';
import 'package:axon_vision/pages/global_widgets/text_fonts/poppins_text_view.dart';
import 'package:axon_vision/utils/app_colors.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:axon_vision/utils/space_sizer.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.dashboardController});

  final DashboardController dashboardController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PoppinsTextView(
            value: 'Selamat Datang, user!',
            size: SizeConfig.safeBlockHorizontal * 2,
            fontWeight: FontWeight.bold,
          ),
          SpaceSizer(vertical: 2),
          Row(
            children: [
              DashboardBlueCard(title: 'Pasien Terdaftar', subtitle: 'X'),
              SpaceSizer(horizontal: 8),
              DashboardBlueCard(title: 'Scan Menunggu', subtitle: 'Y'),
              SpaceSizer(horizontal: 8),
              DashboardBlueCard(title: 'Analisis Selesai', subtitle: 'Z'),
            ],
          ),
          SpaceSizer(vertical: 4),

          PoppinsTextView(
            value: 'Daftar Pasien Saya',
            size: SizeConfig.safeBlockHorizontal * 1.5,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 70,
            height: SizeConfig.safeBlockVertical * 34.5,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: dashboardController.pasienData.isEmpty
                  ? Center(
                      child: PoppinsTextView(
                        value: 'Data Tidak Ditemukan...',
                        size: SizeConfig.safeBlockHorizontal * 1.8,
                      ),
                    )
                  : DashboardTabelDataPasien(isHideID: true),
            ),
          ),
          SpaceSizer(vertical: 1),
          CustomFlatButton(
            radius: 0.7,
            text: 'Lihat Semua Pasien',
            onTap: () {
              dashboardController.changeMenu(1);
            },
            width: SizeConfig.safeBlockHorizontal * 12,
            height: SizeConfig.safeBlockVertical * 4,
            backgroundColor: AppColors.blueDark,
            textSize: SizeConfig.safeBlockHorizontal * 1,
          ),
          SpaceSizer(vertical: 2),
          PoppinsTextView(
            value: 'Scan Sedang Dianalisis',
            size: SizeConfig.safeBlockHorizontal * 1.5,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 70,
            height: SizeConfig.safeBlockVertical * 33,
            child: DashboardTabelAnalisis(),
          ),
          SpaceSizer(vertical: 2),
          CustomFlatButton(
            icon: Icons.refresh,
            colorIconImage: AppColors.white,
            radius: 0.7,
            text: 'Refresh Status',
            onTap: () {},
            width: SizeConfig.safeBlockHorizontal * 12,
            height: SizeConfig.safeBlockVertical * 4,
            backgroundColor: AppColors.blueDark,
            textSize: SizeConfig.safeBlockHorizontal * 1,
          ),
          SpaceSizer(vertical: 5),
        ],
      ),
    );
  }
}

class DashboardBlueCard extends StatelessWidget {
  const DashboardBlueCard({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.blockSizeHorizontal * 18,
      height: SizeConfig.safeBlockVertical * 18.5,
      decoration: BoxDecoration(
        color: AppColors.blueCard,
        borderRadius: BorderRadius.all(
          Radius.circular(SizeConfig.horizontal(1)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(SizeConfig.horizontal(1)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PoppinsTextView(
              value: title,
              size: SizeConfig.safeBlockHorizontal * 1.5,
              fontWeight: FontWeight.bold,
            ),
            PoppinsTextView(
              value: subtitle,
              size: SizeConfig.safeBlockHorizontal * 3,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}

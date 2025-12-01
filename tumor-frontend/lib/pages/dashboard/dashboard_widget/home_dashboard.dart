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
          // 1. HEADER STATISTIK
          PoppinsTextView(
            value: 'Selamat Datang, User!',
            size: SizeConfig.safeBlockHorizontal * 1.5,
            fontWeight: FontWeight.bold,
          ),
          SpaceSizer(vertical: 3),
          Row(
            children: [
              DashboardBlueCard(title: 'Pasien Terdaftar', subtitle: 'X'),
              SpaceSizer(horizontal: 4),
              DashboardBlueCard(title: 'Scan Menunggu', subtitle: 'Y'),
              SpaceSizer(horizontal: 4),
              DashboardBlueCard(title: 'Analisis Selesai', subtitle: 'Z'),
            ],
          ),

          SpaceSizer(vertical: 5), // Jarak pemisah yang lega
          // 2. TABEL DAFTAR PASIEN
          PoppinsTextView(
            value: 'Daftar Pasien Saya',
            size: SizeConfig.safeBlockHorizontal * 1.3,
            fontWeight: FontWeight.bold,
          ),
          SpaceSizer(vertical: 1.5), // Jarak ke tabel

          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyDisabled),
              borderRadius: BorderRadius.circular(8),
            ),
            width: SizeConfig.blockSizeHorizontal * 70,

            // SAYA NAIKKAN SEDIKIT JADI 250 BIAR AMAN
            height: 250,

            child: dashboardController.pasienData.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: PoppinsTextView(
                        value: 'Data Tidak Ditemukan...',
                        size: SizeConfig.safeBlockHorizontal * 1.2,
                      ),
                    ),
                  )
                : const DashboardTabelDataPasien(isHideID: true),
          ),

          SpaceSizer(vertical: 1),

          // TOMBOL LIHAT SEMUA (Dipindah ke Kanan)
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, // <--- Rata Kanan
              children: [
                CustomFlatButton(
                  radius: 1.0,
                  text: 'Lihat Semua Pasien',
                  onTap: () {
                    dashboardController.changeMenu(1);
                  },
                  width: SizeConfig.safeBlockHorizontal * 12,
                  height: SizeConfig.safeBlockVertical * 4,
                  backgroundColor: AppColors.blueDark,
                  textSize: SizeConfig.safeBlockHorizontal * 0.9,
                ),
              ],
            ),
          ),

          SpaceSizer(vertical: 4), // Jarak lega ke seksi berikutnya
          // 3. TABEL SCAN ANALISIS
          PoppinsTextView(
            value: 'Scan Sedang Dianalisis',
            size: SizeConfig.safeBlockHorizontal * 1.3, // Font dibesarkan
            fontWeight: FontWeight.bold,
          ),
          SpaceSizer(vertical: 1.5),

          Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.greyDisabled),
              borderRadius: BorderRadius.circular(8),
            ),
            width: SizeConfig.blockSizeHorizontal * 70,

            // TINGGI UNTUK 3 BARIS (160 + buffer)
            height: 170,

            child: const DashboardTabelAnalisis(),
          ),

          SpaceSizer(vertical: 1),

          // TOMBOL REFRESH (Dipindah ke Kanan)
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end, // <--- Rata Kanan
              children: [
                CustomFlatButton(
                  icon: Icons.refresh,
                  colorIconImage: AppColors.blueDark, // Icon biru
                  radius: 1.0,
                  text: 'Refresh Status',
                  onTap: () {},
                  width: SizeConfig.safeBlockHorizontal * 12,
                  height: SizeConfig.safeBlockVertical * 4,
                  backgroundColor: AppColors.white, // Background Putih
                  borderColor: AppColors.blueDark, // Border Biru
                  textColor: AppColors.blueDark, // Teks Biru
                  textSize: SizeConfig.safeBlockHorizontal * 0.9,
                ),
              ],
            ),
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
              size: SizeConfig.safeBlockHorizontal * 1.1,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            PoppinsTextView(
              value: subtitle,
              size: SizeConfig.safeBlockHorizontal * 2.5,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

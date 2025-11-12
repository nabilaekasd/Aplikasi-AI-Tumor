import 'package:axon_vision/controllers/dashboard_controller.dart';
import 'package:axon_vision/pages/dashboard/dashboard_widget/dashboard_tabel_data_pasien.dart';
import 'package:axon_vision/pages/dashboard/dashboard_widget/hasil_analisis_pasien.dart';
import 'package:axon_vision/pages/dashboard/dashboard_widget/home_dashboard.dart';
import 'package:axon_vision/pages/dashboard/dashboard_widget/left_text_menu.dart';
import 'package:axon_vision/pages/dashboard/dashboard_widget/data_pasien_menu_detail.dart';
import 'package:axon_vision/pages/dashboard/dashboard_widget/pengaturan_profil.dart';
import 'package:axon_vision/pages/dashboard/dashboard_widget/upload_scan_mri.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_flat_button.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_text_field.dart';
import 'package:axon_vision/pages/global_widgets/frame/frame_scaffold.dart';
import 'package:axon_vision/pages/global_widgets/text_fonts/poppins_text_view.dart';
import 'package:axon_vision/utils/app_colors.dart';
import 'package:axon_vision/utils/asset_list.dart';
import 'package:axon_vision/utils/fluid_space_sizer.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:axon_vision/utils/space_sizer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

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
      view: GetBuilder<DashboardController>(
        init: DashboardController(),
        builder: (DashboardController dashboardController) => Center(
          child: Container(
            width: SizeConfig.safeBlockHorizontal * 90,
            height: SizeConfig.safeBlockVertical * 96,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(SizeConfig.safeBlockHorizontal * 2.5),
              ),
            ),
            child: Row(
              children: [
                Column(
                  children: [
                    Image.asset(
                      AssetList.axonLogo,
                      fit: BoxFit.cover,
                      width: SizeConfig.safeBlockHorizontal * 15,
                      height: SizeConfig.safeBlockVertical * 15,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: SizeConfig.horizontal(2)),
                      child: LeftTextMenu(
                        onMenuTap: (index) {
                          dashboardController.changeMenu(index);
                        },
                        activeIndex: dashboardController.activeMenuIndex,
                      ),
                    ),
                  ],
                ),
                SingleChildScrollView(
                  physics: dashboardController.activeMenuIndex == 4
                      ? NeverScrollableScrollPhysics()
                      : BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SpaceSizer(vertical: 3),
                      Row(
                        children: [
                          PoppinsTextView(
                            value: dashboardController.activeMenuIndex == 0
                                ? 'Dashboard'
                                : dashboardController.activeMenuIndex == 5
                                ? 'Pengaturan Profil'
                                : 'Detail Pasien',
                            size: SizeConfig.safeBlockHorizontal * 1.6,
                            fontWeight: FontWeight.bold,
                          ),
                          SpaceSizer(
                            horizontal: dashboardController.activeMenuIndex == 0
                                ? 49
                                : dashboardController.activeMenuIndex == 5
                                ? 44
                                : 47,
                          ),
                          PoppinsTextView(
                            value: 'Halo, User',
                            size: SizeConfig.safeBlockHorizontal * 1.5,
                            fontWeight: FontWeight.w400,
                          ),
                          SpaceSizer(horizontal: 2),
                          CircleAvatar(child: Icon(Icons.person)),
                          FluidSpaceSizer(minSpace: 0.1, maxSpace: 2),
                        ],
                      ),
                      SpaceSizer(vertical: 4),
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
                      SpaceSizer(vertical: 3),
                      _buildActiveMenu(dashboardController),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActiveMenu(DashboardController dashboardController) {
    switch (dashboardController.activeMenuIndex) {
      case 0:
        return Home(dashboardController: dashboardController);
      case 1:
        return DaftarPasienMenu();
      case 2:
        return DataPasienMenuDetail(
          dashboardController: dashboardController,
          pasienData: dashboardController.selectedPasien!,
          onBack: () {
            dashboardController.backToPasienList();
          },
        );
      case 3:
        return UploadScanMri(
          dashboardController: dashboardController,
          pasienData: dashboardController.selectedPasien!,
          onBack: () {
            dashboardController.backToPasienList();
          },
        );
      case 4:
        return HasilAnalisisPasien(
          dashboardController: dashboardController,
          pasienData: dashboardController.selectedPasien!,
          onBack: () {
            dashboardController.backToPasienList();
          },
        );
      case 5:
        return PengaturanProfil();

      default:
        return Home(dashboardController: dashboardController);
    }
  }
}

class DaftarPasienMenu extends StatelessWidget {
  const DaftarPasienMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: DashboardController(),
      builder: (dashboardController) => Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomTextField(
                controller: dashboardController.searchController,
                width: 60,
                title: '',
                borderRadius: 1,
                hintText: 'Cari berdasarkan nama atau ID...',
              ),
              SpaceSizer(horizontal: 2),
              CustomFlatButton(
                text: 'Cari',
                onTap: () {
                  dashboardController.searchPatients(
                    dashboardController.searchController.text,
                  );
                },
                radius: 1.4,
                width: SizeConfig.blockSizeHorizontal * 8,
                backgroundColor: AppColors.bgColor,
              ),
            ],
          ),
          SpaceSizer(vertical: 2),
          SizedBox(
            width: SizeConfig.blockSizeHorizontal * 70,
            height: SizeConfig.safeBlockVertical * 70,
            child: dashboardController.pasienData.isEmpty
                ? Center(
                    child: PoppinsTextView(
                      value: 'Data Tidak Ditemukan...',
                      size: SizeConfig.safeBlockHorizontal * 1.8,
                    ),
                  )
                : DashboardTabelDataPasien(isHideID: false),
          ),
        ],
      ),
    );
  }
}

import 'package:axon_vision/controllers/dashboard_controller.dart';
import 'package:axon_vision/pages/global_widgets/text_fonts/poppins_text_view.dart';
import 'package:axon_vision/utils/app_colors.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DashboardTabelAnalisis extends StatelessWidget {
  const DashboardTabelAnalisis({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (DashboardController dashboardController) => SfDataGrid(
        gridLinesVisibility: GridLinesVisibility.both,
        headerGridLinesVisibility: GridLinesVisibility.both,
        source: dashboardController.analisisDataSource, //todo: lanjut analis
        columns: <GridColumn>[
          GridColumn(
            width: SizeConfig.horizontal(17.4),
            columnName: 'name',
            label: Container(
              color: AppColors.greyDisabled,
              alignment: Alignment.center,
              child: PoppinsTextView(
                size: SizeConfig.safeBlockHorizontal * 1.2,
                value: 'Nama Pasien',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridColumn(
            columnName: 'tanggal_scan',
            width: SizeConfig.horizontal(17.4),
            label: Container(
              color: AppColors.greyDisabled,
              alignment: Alignment.center,
              child: PoppinsTextView(
                size: SizeConfig.safeBlockHorizontal * 1.2,
                value: 'Tanggal Scan',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridColumn(
            columnName: 'status',
            width: SizeConfig.horizontal(17.4),
            label: Container(
              color: AppColors.greyDisabled,
              alignment: Alignment.center,
              child: PoppinsTextView(
                size: SizeConfig.safeBlockHorizontal * 1.2,
                value: 'Status',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridColumn(
            width: SizeConfig.horizontal(17.4),
            columnName: 'estimasi',
            label: Container(
              color: AppColors.greyDisabled,
              alignment: Alignment.center,
              child: PoppinsTextView(
                size: SizeConfig.safeBlockHorizontal * 1.2,
                value: 'Estimasi Selesai',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:axon_vision/controllers/dashboard_controller.dart';
import 'package:axon_vision/pages/global_widgets/text_fonts/poppins_text_view.dart';
import 'package:axon_vision/utils/app_colors.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DashboardTabelDataPasien extends StatelessWidget {
  const DashboardTabelDataPasien({super.key, this.isHideID = true});
  final bool? isHideID;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (DashboardController dashboardController) => Column(
        children: [
          SfDataGrid(
            gridLinesVisibility: GridLinesVisibility.both,
            headerGridLinesVisibility: GridLinesVisibility.both,
            source: dashboardController.pasienDataSource,

            verticalScrollPhysics: isHideID == true
                ? NeverScrollableScrollPhysics()
                : ScrollPhysics(),
            columns: <GridColumn>[
              GridColumn(
                visible: isHideID == true ? false : true,
                width: SizeConfig.horizontal(isHideID == true ? 17.4 : 10),

                columnName: 'id_patient',
                label: Container(
                  color: AppColors.greyDisabled,
                  alignment: Alignment.center,
                  child: PoppinsTextView(
                    size: SizeConfig.safeBlockHorizontal * 1.2,
                    value: 'ID Pasien',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

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
                    overFlow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              GridColumn(
                columnName: 'tanggal_lahir',
                width: SizeConfig.horizontal(17.4),
                label: Container(
                  color: AppColors.greyDisabled,
                  alignment: Alignment.center,
                  child: PoppinsTextView(
                    size: SizeConfig.safeBlockHorizontal * 1.2,
                    value: 'Tanggal Lahir',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridColumn(
                columnName: 'status',
                width: SizeConfig.horizontal(isHideID == true ? 17.4 : 10),
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
                width: SizeConfig.horizontal(isHideID == true ? 17.4 : 15),
                columnName: 'action',
                label: Container(
                  color: AppColors.greyDisabled,
                  alignment: Alignment.center,
                  child: PoppinsTextView(
                    size: SizeConfig.safeBlockHorizontal * 1.2,
                    value: 'Aksi',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          isHideID == true
              ? SizedBox.shrink()
              : Container(
                  color: AppColors.greyCard,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SfDataPager(
                        visibleItemsCount: 5,
                        nextPageItemVisible: false,
                        previousPageItemVisible: false,
                        delegate: dashboardController.pasienDataSource,
                        pageCount: dashboardController.getPasienPageCount(),
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

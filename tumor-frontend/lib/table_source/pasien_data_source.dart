import 'package:axon_vision/models/data_pasien_model.dart';
import 'package:axon_vision/pages/global_widgets/custom/custom_ripple_button.dart';
import 'package:axon_vision/pages/global_widgets/text_fonts/poppins_text_view.dart';
import 'package:axon_vision/utils/app_colors.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PasienDataSource extends DataGridSource {
  late List<DataGridRow> dataGridRows;
  final List<DataPasienModel> dataPasien;
  final Function(DataPasienModel) onUploadTap;

  PasienDataSource({required this.dataPasien, required this.onUploadTap}) {
    dataGridRows = dataPasien
        .map<DataGridRow>(
          (pasien) => DataGridRow(
            cells: [
              DataGridCell(columnName: 'id_patient', value: pasien.idPatient),
              DataGridCell(columnName: 'nama', value: pasien.namePatient),
              DataGridCell(
                columnName: 'tanggal_lahir',
                value: pasien.tanggalLahir,
              ),
              DataGridCell(columnName: 'status', value: pasien.status),
              DataGridCell(columnName: 'action', value: pasien),
            ],
          ),
        )
        .toList();
  }

  @override
  List<DataGridRow> get rows => dataGridRows;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((dataGridCell) {
        return Container(
          padding: EdgeInsets.only(
            left: SizeConfig.horizontal(
              dataGridCell.columnName == 'action' ? 0 : 1,
            ),
          ),
          alignment: dataGridCell.columnName == 'action'
              ? Alignment.center
              : Alignment.centerLeft,
          child: dataGridCell.columnName == 'action'
              ? CustomRippleButton(
                  onTap: () {
                    final dataPasien = dataGridCell.value as DataPasienModel;
                    onUploadTap(dataPasien);
                  },
                  child: Icon(Icons.file_upload, color: AppColors.greyDisabled),
                )
              : PoppinsTextView(
                  value: dataGridCell.value.toString(),
                  size: SizeConfig.safeBlockHorizontal * 1.2,
                ),
        );
      }).toList(),
    );
  }
}

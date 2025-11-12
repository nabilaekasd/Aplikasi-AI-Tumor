import 'package:axon_vision/models/data_analisis_model.dart';
import 'package:axon_vision/pages/global_widgets/text_fonts/poppins_text_view.dart';
import 'package:axon_vision/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AnalisisDataSource extends DataGridSource {
  late List<DataGridRow> dataGridRows;

  AnalisisDataSource(List<DataAnalisisModel> analisisData) {
    dataGridRows = analisisData
        .map<DataGridRow>(
          (dataGridRows) => DataGridRow(
            cells: [
              DataGridCell(
                columnName: 'nama_patient',
                value: dataGridRows.namePatient,
              ),
              DataGridCell(
                columnName: 'tanggal_scan',
                value: dataGridRows.tanggalScan,
              ),
              DataGridCell(columnName: 'status', value: dataGridRows.status),
              DataGridCell(
                columnName: 'estimasi',
                value: dataGridRows.estimasi,
              ),
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
          padding: EdgeInsets.only(left: SizeConfig.horizontal(1)),
          alignment: Alignment.centerLeft,
          child: PoppinsTextView(
            value: dataGridCell.value.toString(),
            size: SizeConfig.safeBlockHorizontal * 1.2,
          ),
        );
      }).toList(),
    );
  }
}

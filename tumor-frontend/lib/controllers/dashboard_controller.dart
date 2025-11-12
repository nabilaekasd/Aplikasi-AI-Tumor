import 'dart:developer';

import 'package:axon_vision/models/data_analisis_model.dart';
import 'package:axon_vision/models/data_pasien_model.dart';
import 'package:axon_vision/table_source/analisis_data_source.dart';
import 'package:axon_vision/table_source/pasien_data_source.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  List<DataPasienModel> pasienData = <DataPasienModel>[];
  List<DataAnalisisModel> analisisData = <DataAnalisisModel>[];
  List<DataPasienModel> originalPasienData = <DataPasienModel>[];
  TextEditingController searchController = TextEditingController();
  late PasienDataSource pasienDataSource;
  late AnalisisDataSource analisisDataSource;
  final RxBool isSearching = RxBool(false);
  final int pageSize = 6;
  final RxInt _activeMenuIndex = 0.obs;
  final RxInt changeTextMenu = RxInt(0);
  final Rx<DataPasienModel?> _selectedPasien = Rx<DataPasienModel?>(null);

  int get activeMenuIndex => _activeMenuIndex.value;
  DataPasienModel? get selectedPasien => _selectedPasien.value;

  @override
  void onInit() {
    super.onInit();
    pasienData = getPasienData();
    analisisData = getAnalisisData();
    analisisDataSource = AnalisisDataSource(analisisData);
    originalPasienData = List.from(pasienData);
    pasienDataSource = PasienDataSource(
      dataPasien: pasienData,
      onUploadTap: handledChangeScreenDynamic,
    );
  }

  void handledChangeScreenDynamic(DataPasienModel pasien) {
    _selectedPasien.value = pasien;
    _activeMenuIndex.value = 2;
    update();
  }

  void changeMenu(int index) {
    _activeMenuIndex.value = index;
    log(index.toString());
    update();
  }

  void backToPasienList() {
    _activeMenuIndex.value = 1;
    _selectedPasien.value = null;

    update();
  }

  // Method untuk mencari pasien
  void searchPatients(String query) {
    isSearching.value = true;

    if (query.isEmpty) {
      // Jika query kosong, kembalikan ke data original
      pasienData = List.from(originalPasienData);
    } else {
      // Filter data berdasarkan nama atau ID
      pasienData = originalPasienData.where((patient) {
        final name = patient.namePatient.toLowerCase();
        final id = patient.idPatient.toLowerCase();
        final searchLower = query.toLowerCase();

        return name.contains(searchLower) || id.contains(searchLower);
      }).toList();
    }

    // Update data source dengan data yang sudah difilter
    pasienDataSource = PasienDataSource(
      dataPasien: pasienData,
      onUploadTap: handledChangeScreenDynamic,
    );

    update(); // Trigger UI rebuild
  }

  double getPasienPageCount() {
    return (pasienData.length / pageSize).ceilToDouble();
  }

  double getAnalisisPageCount() {
    return (analisisData.length / pageSize).ceilToDouble();
  }

  //Dummy Data
  List<DataPasienModel> getPasienData() {
    return [
      DataPasienModel(
        idPatient: 'P001',
        namePatient: 'Abdul',
        tanggalLahir: 'DD/MM/YYYY',
        status: 'Aktif',
        action: 'icon',
      ),
      DataPasienModel(
        idPatient: 'P002',
        namePatient: 'TOGAR',
        tanggalLahir: 'DD/MM/YYYY',
        status: 'Aktif',
        action: 'icon',
      ),
      DataPasienModel(
        idPatient: 'P003',
        namePatient: 'Abdul',
        tanggalLahir: 'DD/MM/YYYY',
        status: 'Aktif',
        action: 'icon',
      ),
      DataPasienModel(
        idPatient: 'P004',
        namePatient: 'Abdul',
        tanggalLahir: 'DD/MM/YYYY',
        status: 'Aktif',
        action: 'icon',
      ),
      DataPasienModel(
        idPatient: 'P005',
        namePatient: 'Abdul',
        tanggalLahir: 'DD/MM/YYYY',
        status: 'Aktif',
        action: 'icon',
      ),
      DataPasienModel(
        idPatient: 'P006',
        namePatient: 'Abdul',
        tanggalLahir: 'DD/MM/YYYY',
        status: 'Aktif',
        action: 'icon',
      ),
      DataPasienModel(
        idPatient: 'P006',
        namePatient: 'Abdul',
        tanggalLahir: 'DD/MM/YYYY',
        status: 'Aktif',
        action: 'icon',
      ),
      DataPasienModel(
        idPatient: 'P006',
        namePatient: 'Abdul',
        tanggalLahir: 'DD/MM/YYYY',
        status: 'Aktif',
        action: 'icon',
      ),
      DataPasienModel(
        idPatient: 'P006',
        namePatient: 'Abdul',
        tanggalLahir: 'DD/MM/YYYY',
        status: 'Aktif',
        action: 'icon',
      ),
      DataPasienModel(
        idPatient: 'P006',
        namePatient: 'Abdul',
        tanggalLahir: 'DD/MM/YYYY',
        status: 'Aktif',
        action: 'icon',
      ),
      DataPasienModel(
        idPatient: 'P006',
        namePatient: 'Abdul',
        tanggalLahir: 'DD/MM/YYYY',
        status: 'Aktif',
        action: 'icon',
      ),
      DataPasienModel(
        idPatient: 'P006',
        namePatient: 'Abdul',
        tanggalLahir: 'DD/MM/YYYY',
        status: 'Aktif',
        action: 'icon',
      ),
      DataPasienModel(
        idPatient: 'P006',
        namePatient: 'Abdul',
        tanggalLahir: 'DD/MM/YYYY',
        status: 'Aktif',
        action: 'icon',
      ),
    ];
  }

  //Dummy Data
  List<DataAnalisisModel> getAnalisisData() {
    return [
      DataAnalisisModel(
        namePatient: 'Abdul',
        tanggalScan: 'DD/MM/YYYY',
        status: 'Sedang Di Analisis',
        estimasi: '30 Menit',
      ),
      DataAnalisisModel(
        namePatient: 'Abdul',
        tanggalScan: 'DD/MM/YYYY',
        status: 'Menunggu',
        estimasi: '30 Menit',
      ),
      DataAnalisisModel(
        namePatient: 'Abdul',
        tanggalScan: 'DD/MM/YYYY',
        status: 'Menunggu',
        estimasi: '30 Menit',
      ),
    ];
  }
}

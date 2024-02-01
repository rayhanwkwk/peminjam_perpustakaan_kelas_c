import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_get_pinjam.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class PeminjamanController extends GetxController with StateMixin<List<DataGetPinjam>>{
  //TODO: Implement PeminjamanController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  String formatTanggal(tanggal) {
    var tanggalFormat = DateTime.parse(tanggal);
    DateFormat formatter = DateFormat('MM-dd-yyyy');
    String formatted = formatter.format(tanggalFormat);
    return formatted;
  }
  getData() async {change(null, status: RxStatus.loading());
  try {
    final response = await ApiProvider.instance().get("${Endpoint.pinjam}/${await StorageProvider.read(StorageKey.idUser)}");
    if (response.statusCode == 200) {
      final ResponseGetPinjam responsePinjam = ResponseGetPinjam.fromJson(response.data);
      if(responsePinjam.data!.isEmpty){
        change(null, status: RxStatus.empty());
      }else{
        change(responsePinjam.data, status: RxStatus.success());
      }
    } else {
      change(null, status: RxStatus.error("Oops! Gagal mengambil data"));
    }
  } on DioException catch (e) {
    if (e.response != null) {
      if (e.response?.data != null) {
        log("dio ${e.response?.data['message']}");
        change(null, status: RxStatus.error("${e.response?.data['message']}"));
      }
    } else {
      change(null, status: RxStatus.error("cek"+(e.message ?? "")));
    }
  } catch (e) {
    change(null, status: RxStatus.error("catch "+e.toString()));
  }
  }
}

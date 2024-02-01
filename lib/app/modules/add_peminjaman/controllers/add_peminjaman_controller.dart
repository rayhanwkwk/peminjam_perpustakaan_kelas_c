import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:peminjam_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class AddPeminjamanController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController tanggalPinjam = TextEditingController();
  final TextEditingController tanggalKembalian = TextEditingController();
  final loading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  pinjam() async {loading(true);
  try {
    FocusScope.of(Get.context!).unfocus();
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      final response = await ApiProvider.instance().post(Endpoint.pinjam,
          data: (
              {"tanggal_pinjam": tanggalPinjam.text.toString(),
                "tanggal_kembali": tanggalKembalian.text.toString(),
                "user_id" : int.parse(StorageProvider.read(StorageKey.idUser)),
                "book_id" : int.parse(Get.parameters['id'].toString()),
              }));
      if (response.statusCode == 201) {
        Get.snackbar("BERHASIL", "Anjay berhasil cuyy aku jadi pengen buang pc ku ke kolam ikan pki terus kasih makan bebek peking depan rumah anak gila", backgroundColor: Colors.purpleAccent);
        loading(false);
      } else {
        loading(false);
        Get.snackbar("Sorry", "Simpan Gagal", backgroundColor: Colors.orange);
      }
    }
  } on dio.DioException catch (e) {loading(false);
  if (e.response != null) {
    if (e.response?.data != null) {
      Get.snackbar("Sorry b aja", "${e.response?.data['message']}", backgroundColor: Colors.orange);
    }
  } else {
    Get.snackbar("Sorry banget", e.message ?? "", backgroundColor: Colors.red);
  }
  } catch (e) {loading(false);
  Get.snackbar("w harakiri ae", e.toString(), backgroundColor: Colors.red);
  }
  }
}

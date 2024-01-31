import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../data/constant/endpoint.dart';
import '../../../data/provider/api_provider.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController notelpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
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

  addRegister() async {loading(true);
  try {
    FocusScope.of(Get.context!).unfocus();
    formKey.currentState?.save();
    if (formKey.currentState!.validate()) {
      final response = await ApiProvider.instance().post(Endpoint.register,
          data: (
              {"nama": namaController.text.toString(),
                "username": usernameController.text.toString(),
                "telp": notelpController.text.toString(),
                "alamat": alamatController.text.toString(),
                "password": passwordController.text.toString(),
              }));
      if (response.statusCode == 201) {
         Get.snackbar("Berhasil", "Buku Berhasil Ditambahkan", backgroundColor: Colors.pink);
        // Get.back();
      } else {
        Get.snackbar("Sorry", "Buku tidak masuk", backgroundColor: Colors.orange);
      }
    }loading(false);
  } on dio.DioException catch (e) {loading(false);
  if (e.response != null) {
    if (e.response?.data != null) {
      Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
    }
  } else {
    Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
  }
  } catch (e) {loading(false);
  Get.snackbar("Sorry", e.toString(), backgroundColor: Colors.red);
  }
  }
}

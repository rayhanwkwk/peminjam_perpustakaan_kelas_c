import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body:Center(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.namaController,
                decoration: InputDecoration(hintText: "Nama"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "data tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.usernameController,
                decoration: InputDecoration(hintText: "Username"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "data tidak boleh kosong";
                  }
                  return null;
                },
              ),TextFormField(
                controller: controller.notelpController,
                decoration: InputDecoration(hintText: "No. Telp"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "data tidak boleh kosong";
                  }
                  return null;
                },
              ),TextFormField(
                controller: controller.alamatController,
                decoration: InputDecoration(hintText: "Alamat"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "data tidak boleh kosong";
                  }
                  return null;
                },
              ),TextFormField(
                controller: controller.passwordController,
                decoration: InputDecoration(hintText: "password"),
                validator: (value) {
                  if (value!.length < 2) {
                    return "data tidak boleh kosong";
                  }
                  return null;
                },
              ), TextButton(onPressed: () => Get.offAllNamed(Routes.LOGIN), child: Text("Sudah Punya Akun")),
              Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                  onPressed: () {
                    controller.addRegister();
                  },
                  child: Icon(Icons.add_box)
              ))
            ],
          ),
        ),
      ),
    );
  }
}

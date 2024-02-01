import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.parameters['judul']}'),
        centerTitle: true,
      ),
      body: Form(
          key: controller.formKey,
        child: Column(
          children: [
            // DateTimePicker(
            //   initialValue: DateTime.now().toString(),
            //   dateMask: 'yyyy-MM-dd',
            //   firstDate: DateTime(2000),
            //   lastDate: DateTime(2100),
            //   dateLabelText: 'Date',
            //   onChanged: (val) => print(val),
            //   controller: controller.tanggalPinjam,
            //   validator: (value) {
            //     if (value!.length < 2) {
            //       return "tanggal tidak boleh kosong";
            //     }
            //     return null;
            //   },
            // ),
            // DateTimePicker(
            //   initialValue: DateTime.now().toString(),
            //   dateMask: 'yyyy-MM-dd',
            //   firstDate: DateTime(2000),
            //   lastDate: DateTime(2100),
            //   dateLabelText: 'Date',
            //   onChanged: (val) => print(val),
            //   controller: controller.tanggalKembalian,
            //   validator: (value) {
            //     if (value!.length < 2) {
            //       return "data tidak boleh kosong";
            //     }
            //     return null;
            //   },
            // ),
            TextFormField(
              controller: controller.tanggalPinjam,
              decoration: InputDecoration(hintText: "tanggal pinjam"),
              validator: (value) {
                if (value!.length < 2) {
                  return "data tidak boleh kosong";
                }
                return null;
              },
            ),
            TextFormField(
              controller: controller.tanggalKembalian,
              decoration: InputDecoration(hintText: "tanggal kembali"),
              validator: (value) {
                if (value!.length < 2) {
                  return "data tidak boleh kosong";
                }
                return null;
              },
            ),
            Obx(() => controller.loading.value
                ? CircularProgressIndicator()
                : ElevatedButton(
                onPressed: () {
                  controller.pinjam();
                },
                child: Icon(Icons.add_box)
            ))
          ],
        )
      ),
    );
  }
}

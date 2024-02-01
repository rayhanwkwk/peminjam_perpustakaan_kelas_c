import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_get_pinjam.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/data/model/response_pinjam.dart';

import '../../../routes/app_pages.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanView'),
        centerTitle: true,
      ),
    body: controller.obx((state) => ListView.separated(
      itemCount: state!.length,
      itemBuilder: (context, index){
        DataGetPinjam datagetpinjam = state[index];
        return ListTile(
          title: Text("${datagetpinjam.book?.judul}"),
          subtitle: Text("Penulis ${controller.formatTanggal(datagetpinjam.tanggalPinjam)} - ${controller.formatTanggal(datagetpinjam.tanggalKembali)}"),
          leading: Icon(Icons.book, color: Colors.lightBlueAccent,),
        );
      },
      separatorBuilder: (context, index)=> const Divider(),
      ),onLoading: Center(child:CupertinoActivityIndicator(radius: 25, ))
    ),
    );
  }
}

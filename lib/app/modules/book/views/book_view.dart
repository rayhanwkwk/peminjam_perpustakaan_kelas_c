import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_kelas_c/app/routes/app_pages.dart';

import '../../../data/model/response_book.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BookView'),
          centerTitle: true,
        ),
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index){
            DataBook dataBook = state[index];
            return ListTile(
              title: Text("${dataBook.judul}"),
              subtitle: Text("Penulis ${dataBook.penulis}\n${dataBook.penerbit} - ${dataBook.tahunTerbit}"),
              leading: Icon(Icons.book, color: Colors.lightBlueAccent,),
              trailing: ElevatedButton(onPressed: ()=> Get.toNamed(Routes.ADD_PEMINJAMAN, parameters: {
                'id' : (dataBook.id ??0).toString(),'judul':dataBook.judul ??'-'
              }),
                child: Icon(Icons.start)),
            );
            },
          separatorBuilder: (context, index)=> const Divider(),
        ),onLoading: Center(child:CupertinoActivityIndicator(radius: 25, ))
        ),
    );
  }
}


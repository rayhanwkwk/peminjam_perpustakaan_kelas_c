import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/response_book.dart';
import '../../../routes/app_pages.dart';
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
        body: const Center(
          child: Text(
            'Peminjaman Sudah Berjalan',
            style: TextStyle(fontSize: 20),
          ),
        )
    );
  }
}


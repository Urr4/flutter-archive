import 'package:flutter/material.dart';
import 'package:flutter_archive/widgets/books/book_list.dart';

import 'application/context.dart';
import 'domain/book.dart';
import 'domain/book_service.dart';

class CentralHomePage extends StatefulWidget {
  const CentralHomePage({super.key});

  @override
  State<CentralHomePage> createState() => _CentralHomePageState();
}

class _CentralHomePageState extends State<CentralHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('PDF-Archive'),
      ),
      body: Center(
        child: BookList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print('Upload PDF not implemented yet'),
        tooltip: 'Upload PDF',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




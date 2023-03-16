import 'package:flutter/material.dart';
import 'package:flutter_archive/domain/book.dart';
import 'package:provider/provider.dart';

import 'book_list.dart';

class BookPreview extends StatelessWidget {
  final Book book;
  var onDelete;

  BookPreview({Key? key, required this.book, required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        height: 80.0,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                          visible: constraints.maxWidth >= 650,
                          child: Image.asset("book_placeholder.jpg")),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(book.title),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    content: Text(
                                        "Do you really want to delete '${book.title}'?"),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            print("Aborting");
                                            Navigator.pop(context);
                                          },
                                          child: Text("CANCEL")),
                                      TextButton(
                                          onPressed: () {
                                            print("Deleting '${book.title}'");
                                            onDelete(book);
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK")),
                                    ],
                                  ))
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

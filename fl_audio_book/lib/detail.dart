// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:fl_audio_book/models/ebook.dart';
import 'package:fl_audio_book/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookDetailsScreen extends StatefulWidget {
  final Book book;

  const BookDetailsScreen({
    Key? key,
    required this.book,
    required List pdfUrls,
  }) : super(key: key);

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  late String enteredPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: blackColor2,
        title: Text(
          widget.book.name,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 28),
          GestureDetector(
            // onTap: showPasswordDialog,
            child: Image.network(
              widget.book.image,
              width: 200,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Author: ${widget.book.author}',
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
          // const SizedBox(height: 10),
          // Text(
          //   'Rating: ${widget.book.rate}',
          //   style: const TextStyle(
          //     fontSize: 16,
          //     color: Colors.orangeAccent,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          const SizedBox(height: 20),
          Text(
            'Description: ${widget.book.description}',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => openPDFFile(context),
            child: const Text(
              'Read',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  void openPDFFile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerPage(
          pdfUrls: [widget.book.readLink],
          password: enteredPassword,
          book: widget.book, // Pass the book object here
        ),
      ),
    );
  }
}

class PDFViewerPage extends StatelessWidget {
  final List<String> pdfUrls;
  final String password;
  final Book book;

  const PDFViewerPage({
    Key? key,
    required this.pdfUrls,
    required this.password,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        foregroundColor: blackColor2,
        title: Text(
          book.name,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: pdfUrls.length,
        itemBuilder: (context, index) => SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SfPdfViewer.network(
            pdfUrls[index],
            password: password,
          ),
        ),
      ),
    );
  }
}

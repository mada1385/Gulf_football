import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

class Termsofusescreen extends StatelessWidget {
  final pdfController = PdfController(
    document: PdfDocument.openAsset("asset/termsofuse.pdf"),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: PdfView(
        controller: pdfController,
      )),
    );
  }
}

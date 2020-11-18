import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:native_pdf_view/native_pdf_view.dart';

import 'nointernetscreen.dart';

class Termsofusescreen extends StatelessWidget {
  final pdfController = PdfController(
    document: PdfDocument.openAsset("asset/termsofuse.pdf"),
  );

  @override
  Widget build(BuildContext context) {
    return ConnectivityWidgetWrapper(
      offlineWidget: Nointernetscreen(),
      child: Scaffold(
        body: Center(
            child: PdfView(
          controller: pdfController,
        )),
      ),
    );
  }
}

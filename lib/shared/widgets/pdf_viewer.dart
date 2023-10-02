import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../core/parameters/parameters.dart';
import '../models/file_model.dart';

class PDFViewer extends StatefulWidget {
  final FileModel file;

  const PDFViewer(this.file, {super.key});

  @override
  _PDFViewerState createState() => _PDFViewerState();
}

class _PDFViewerState extends State<PDFViewer> {
  final _controller = PdfViewerController();

  @override
  void initState() {
    _controller.addListener(({final property}) {});
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'PDF',
          ),
        ),
        body: widget.file.fileInfo != null && widget.file.fileInfo!.type == 104
            ? SfPdfViewer.file(
                widget.file.fileContent!,
                onDocumentLoadFailed: (final details) {
                  print('error pdf ${details.error}    ${details.description}');
                },
                controller: _controller,
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height,
                child: widget.file.fullPath == null
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: const Center(
                          child: Text(' No data find !'),
                        ),
                      )
                    : SfPdfViewer.network(
                        widget.file.fullPath!,
                        headers: Parameters.getHeader(),
                        onDocumentLoadFailed: (final details) {
                          print(
                              'error pdf ${details.error}    ${details.description}');
                        },
                        controller: _controller,
                      ),
              ),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/file_model.dart';
import 'pdf_viewer.dart';

class ItemPDFWidget extends StatefulWidget {
  final FileModel file;

  const ItemPDFWidget(this.file, {super.key});

  @override
  _ItemPDFWidgetState createState() => _ItemPDFWidgetState();
}

class _ItemPDFWidgetState extends State<ItemPDFWidget> {
  @override
  void initState() {
    super.initState();
    // getFile();
  }

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (context) => PDFViewer(widget.file),
            ),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: SvgPicture.asset(
            'assets/images/pdf.svg',
            width: 50,
            height: 50,
          ),
        ),
      );
}

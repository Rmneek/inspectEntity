import 'dart:io';
import 'package:flutter/material.dart';
import 'package:inspect_connect/core/utils/constants/app_strings.dart';
import 'package:inspect_connect/features/common_features/presentation/pdf_viewer_screen.dart';

void openPreview(
  BuildContext context, {
  required String pathOrUrl,
  required bool isImage,
  required bool isNetwork,
}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: isImage
              ? (isNetwork
                    ? Image.network(pathOrUrl)
                    : Image.file(File(pathOrUrl)))
              : PDFViewerScreen(url: pathOrUrl),
        ),
      ),
    ),
  );
}

bool isImage(String path) {
  final ext = path.split('.').last.toLowerCase();
  return imageExtensions.contains(ext);
}

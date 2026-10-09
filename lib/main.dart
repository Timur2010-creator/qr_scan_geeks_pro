import 'package:flutter/material.dart';

import 'qr_scanner_screen.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QrScannerScreen(),
    ),
  );
}
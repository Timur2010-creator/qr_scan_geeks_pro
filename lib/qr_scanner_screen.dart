import 'package:flutter/material.dart';

import 'qr_help_sheet.dart';
import 'scanner_overlay_painter.dart';

class QrScannerScreen extends StatelessWidget {
  const QrScannerScreen({super.key});

  static const _accentColor = Color(0xFF72B835);
  static const _bgColor = Color(0xFF1C1C1E);

  void _openHelp(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => const QrHelpSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: UnconstrainedBox(
          child: Container(
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 16),
              onPressed: () => Navigator.maybePop(context),
            ),
          ),
        ),
        title: const Text(
          'Сканируйте QR-код',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          UnconstrainedBox(
            child: Container(
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.help_outline_rounded, color: Colors.white, size: 20),
                onPressed: () => _openHelp(context),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),
            Center(
              child: SizedBox(
                width: 280,
                height: 280,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    CustomPaint(
                      size: const Size(280, 280),
                      painter: ScannerOverlayPainter(
                        color: _accentColor,
                        strokeWidth: 4.5,
                        cornerLength: 36,
                        cornerRadius: 14,
                      ),
                    ),
                    Container(
                      height: 3,
                      width: 260,
                      decoration: BoxDecoration(
                        color: _accentColor,
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: [
                          BoxShadow(
                            color: _accentColor.withOpacity(0.85),
                            blurRadius: 12,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              'Наведите камеру на QR-код фандомата',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 36),
              child: Text(
                'Система автоматически подключится после\nуспешного сканирования.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF8E8E93),
                  fontSize: 13,
                  height: 1.35,
                ),
              ),
            ),
            const Spacer(flex: 3),
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: _accentColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.qr_code_2_rounded,
                color: Colors.white,
                size: 36,
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
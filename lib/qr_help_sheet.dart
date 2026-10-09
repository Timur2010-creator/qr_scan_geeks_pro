import 'package:flutter/material.dart';

const _kPrimaryColor = Color(0xFF72B835);

class QrHelpSheet extends StatelessWidget {
  const QrHelpSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 36,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 48,
            height: 48,
            decoration: const BoxDecoration(
              color: _kPrimaryColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.qr_code_2_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Как сканировать QR-код?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Наведите камеру на QR-код, расположенный на экране\nфандомата.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF8E8E93),
              fontSize: 13,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 24),
          const _StepTile(
            icon: Icons.qr_code_scanner,
            title: 'Шаг 1',
            subtitle: 'Держите QR-код внутри рамки.',
          ),
          const Divider(height: 24, color: Color(0xFFF2F2F7)),
          const _StepTile(
            icon: Icons.flash_on_outlined,
            title: 'Шаг 2',
            subtitle: 'При плохом освещении включите вспышку.',
          ),
          const Divider(height: 24, color: Color(0xFFF2F2F7)),
          const _StepTile(
            icon: Icons.check,
            title: 'Шаг 3',
            subtitle: 'После успешного сканирования подключение\nпроизойдет автоматически.',
          ),
          const SizedBox(height: 28),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: _kPrimaryColor,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(26),
                ),
              ),
              child: const Text(
                'Понятно',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}

class _StepTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const _StepTile({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFFF2F8ED),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: _kPrimaryColor, size: 22),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: _kPrimaryColor,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF2C2C2E),
                  fontSize: 13,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
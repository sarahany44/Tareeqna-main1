import 'package:flutter/material.dart';
import 'package:tareeqna/core/styles.dart';

class ChargeSummary extends StatelessWidget {
  final double basePrice;
  final double vat;
  final double total;

  const ChargeSummary({
    super.key,
    required this.basePrice,
    required this.vat,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Charge', style: AppTextStyles.title24),

        const SizedBox(height: 8),

        _item("Mustang / per hour", basePrice),
        const SizedBox(height: 4),

        _item("VAT (5%)", vat),
        const Divider(height: 20),

        _item("Total", total, bold: true),
      ],
    );
  }

  Widget _item(String title, double amount, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTextStyles.title24),
        Text("\$${amount.toStringAsFixed(0)}", style: AppTextStyles.title24),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tareeqna/constant.dart';

class TipButtons extends StatelessWidget {
  final List<int> tipOptions;
  final int selectedTipAmount;
  final bool showCustomAmount;
  final ValueChanged<int> onTipSelected;
  final VoidCallback onCustomTap;

  const TipButtons({
    super.key,
    required this.tipOptions,
    required this.selectedTipAmount,
    required this.showCustomAmount,
    required this.onTipSelected,
    required this.onCustomTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Give some tips to Sergio Ramasis',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          alignment: WrapAlignment.center,
          children: tipOptions.map((amount) {
            final isSelected = selectedTipAmount == amount;
            return GestureDetector(
              onTap: () => onTipSelected(amount),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isSelected ? kpimaryColor : Colors.grey.shade300,
                    width: isSelected ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: isSelected
                      ? kpimaryColor.withOpacity(0.08)
                      : Colors.white,
                ),
                child: Text(
                  '\$$amount',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: isSelected ? kpimaryColor : Colors.black87,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: onCustomTap,
          child: const Text(
            'Enter other amount',
            style: TextStyle(color: kpimaryColor, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}

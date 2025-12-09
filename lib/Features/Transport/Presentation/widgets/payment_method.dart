import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Transport/Presentation/views/thank_you_screen.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_elevated_button.dart';
import 'package:tareeqna/constant.dart';

class PaymentSelectionColumn extends StatefulWidget {
  const PaymentSelectionColumn({super.key});

  @override
  State<PaymentSelectionColumn> createState() => _PaymentSelectionColumnState();
}

class _PaymentSelectionColumnState extends State<PaymentSelectionColumn> {
  int selectedMethod = 0;

  final List<Map<String, dynamic>> paymentMethods = [
    {
      'icon': 'assets/images/Visa.png',
      'title': '**** **** **** 8970',
      'subtitle': 'Expires: 12/26',
      'color': Color(0xFFDFF6F2),
      'borderColor': Color(0xFF1ABC9C),
    },
    {
      'icon': 'assets/images/Payment.png',
      'title': '**** **** **** 8970',
      'subtitle': 'Expires: 12/26',
      'color': Color(0xFFFDEDEC),
      'borderColor': Colors.transparent,
    },
    {
      'icon': 'assets/images/Payment(1).png',
      'title': 'mailaddress@mail.com',
      'subtitle': 'Expires: 12/26',
      'color': Colors.white,
      'borderColor': Colors.deepPurple,
    },
    {
      'icon': 'assets/images/Payment(2).png',
      'title': 'Cash',
      'subtitle': 'Expires: 12/26',
      'color': Color(0xFFF2F2F2),
      'borderColor': Colors.transparent,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select payment method',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 16),
        ...List.generate(paymentMethods.length, (index) {
          final method = paymentMethods[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedMethod = index;
              });
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: method['color'],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: selectedMethod == index
                      ? method['borderColor']
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Row(
                children: [
                  Image.asset(method['icon'], width: 40, height: 40),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        method['title'],
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        method['subtitle'],
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
        const SizedBox(height: 24),
      ],
    );
  }
}

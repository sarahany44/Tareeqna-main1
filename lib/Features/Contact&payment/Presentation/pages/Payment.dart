import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Contact&payment/presentation/wedigts/custom_successdialog.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_elevated_button.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/payment_method.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/smal_car_item_card.dart';
import 'package:tareeqna/Features/Contact&payment/Presentation/wedigts/charge.dart';
import 'package:tareeqna/constant.dart';

class PaymentScreen extends StatelessWidget {
  final int selectedPaymentMethod;
  const PaymentScreen({super.key, required this.selectedPaymentMethod});

  static const double basePrice = 200.0;
  static const double vatRate = 0.05;

  double get vatAmount => basePrice * vatRate;
  double get totalAmount => basePrice + vatAmount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 100,
        title: const Text('Payment'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Car Info
            SmallCarItemCard(),
            const SizedBox(height: 24),
            // Charges
            ChargeSummary(basePrice: 200, vat: 20, total: 220),
            const SizedBox(height: 24),
            PaymentSelectionColumn(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: CustomButton(
          text: 'Confirm Ride',
          type: ButtonType.transportPrimary,
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const PaymentSuccessDialog(),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_elevated_button.dart';
import 'package:tareeqna/Features/Contact&payment/presentation/wedigts/feedback_dialog.dart';
import 'package:tareeqna/constant.dart';
import 'package:tareeqna/core/styles.dart';

class PaymentSuccessDialog extends StatelessWidget {
  const PaymentSuccessDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close, color: Colors.grey, size: 24),
                ),
              ],
            ),
            // check icon circle
            const Icon(Icons.verified, size: 80, color: Color(0xFF1ABC9C)),
            const SizedBox(height: 20),
            const Text('Payment Success', style: AppTextStyles.title24),
            const SizedBox(height: 3),
            const Text(
              'Your money has been successfully sent to Sergio Ramasis',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 20),
            const Text(
              'Amount',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            const SizedBox(height: 8),
            const Text(
              '\$220',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            Container(
              height: 1,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey.shade400, width: 1),
                ),
              ),
            ),
            SizedBox(height: 10),
            const Text(
              'How is your trip?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your feedback will help us to improve your driving experience better.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 20),
            CustomButton(
              text: 'Please Feedback',
              type: ButtonType.transportPrimary,
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const FeedbackDialog(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

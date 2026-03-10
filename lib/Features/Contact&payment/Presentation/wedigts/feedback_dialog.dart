import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Contact&payment/Presentation/wedigts/Thankyou_dialog.dart';
import 'package:tareeqna/constant.dart';
import 'package:tareeqna/Features/Contact&payment/Presentation/wedigts/Thankyou_dialog.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_elevated_button.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/custom_text_field.dart';
import 'package:tareeqna/Features/Contact&payment/presentation/wedigts/rating_stars.dart';
import 'package:tareeqna/Features/Contact&payment/presentation/wedigts/tips_button.dart';

class FeedbackDialog extends StatefulWidget {
  const FeedbackDialog({super.key});

  @override
  State<FeedbackDialog> createState() => _FeedbackDialogState();
}

class _FeedbackDialogState extends State<FeedbackDialog> {
  int selectedRating = 5;
  int selectedTipAmount = 2;
  bool showCustomAmount = false;

  final TextEditingController feedbackController = TextEditingController();
  final TextEditingController customAmountController = TextEditingController();

  final List<int> tipOptions = [1, 2, 5, 10, 20];

  @override
  void dispose() {
    feedbackController.dispose();
    customAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Icon(Icons.close, color: Colors.grey, size: 24),
              ),
            ),
            const SizedBox(height: 16),
            RatingStars(
              rating: selectedRating,
              onRatingChanged: (value) =>
                  setState(() => selectedRating = value),
            ),
            const SizedBox(height: 12),
            Text(
              _ratingLabel(selectedRating),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kpimaryColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'You rated Sergio Ramasis $selectedRating star${selectedRating > 1 ? 's' : ''}',
              style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
            ),
            const SizedBox(height: 24),
            // CustomTextField(
            //   controller: feedbackController,
            //   hintText: "Write your feedback",
            //   keyboardType: TextInputType.multiline,
            // ),

            // const SizedBox(height: 24),
            TipButtons(
              tipOptions: tipOptions,
              selectedTipAmount: selectedTipAmount,
              showCustomAmount: showCustomAmount,
              onTipSelected: (amount) => setState(() {
                selectedTipAmount = amount;
                showCustomAmount = false;
                customAmountController.clear();
              }),
              onCustomTap: () => setState(() {
                showCustomAmount = !showCustomAmount;
                if (!showCustomAmount)
                  customAmountController.clear();
                else
                  selectedTipAmount = 0;
              }),
            ),
            if (showCustomAmount) ...[
              const SizedBox(height: 12),
            //  CustomAmountField(controller: customAmountController),
            ],
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomButton(
                text: "Submit",
                type: ButtonType.primary,
                onPressed: () {
                  Navigator.of(context).pop();
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => ThankYouDialog(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _ratingLabel(int rating) {
    switch (rating) {
      case 1:
        return 'Poor';
      case 2:
        return 'Fair';
      case 3:
        return 'Good';
      case 4:
        return 'Very Good';
      case 5:
      default:
        return 'Excellent';
    }
  }
}

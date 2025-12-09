import 'package:flutter/material.dart';
import 'package:tareeqna/core/styles.dart';
import 'package:tareeqna/Features/Authentication/Presentation/wedigts/custom_appbar.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/custom_profile.dart';
import 'package:tareeqna/Features/Contact&payment/Presentation/wedigts/control_button_call.dart';

class CallingScreen extends StatefulWidget {
  const CallingScreen({super.key});

  @override
  State<CallingScreen> createState() => _CallingScreenState();
}

class _CallingScreenState extends State<CallingScreen> {
  bool isTalking = false;
  String callDuration = "00:00";

  void startTalking() {
    setState(() {
      isTalking = true;
      callDuration = "01:23";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "", showLogo: true),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 90),
            Expanded(
              child: CustomProfilePictureSection(
                showUserInfo: true,
                userName: 'Omar Khaled',
                statusText: isTalking ? callDuration : 'Calling...',
                size: 150,
              ),
            ),
            CallControls(
              isTalking: isTalking,
              onMainButtonTap: () {
                if (!isTalking) startTalking();
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tareeqna/constant.dart';

class ResendSection extends StatefulWidget {
  final VoidCallback onResend;

  const ResendSection({super.key, required this.onResend});

  @override
  State<ResendSection> createState() => _ResendSectionState();
}

class _ResendSectionState extends State<ResendSection> {
  int _resendCountdown = 45;

  @override
  void initState() {
    super.initState();
    _startResendCountdown();
  }

  void _startResendCountdown() {
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() {
          if (_resendCountdown > 0) _resendCountdown--;
        });
        return _resendCountdown > 0;
      }
      return false;
    });
  }

  void _handleTap() {
    if (_resendCountdown == 0) {
      widget.onResend();
      setState(() {
        _resendCountdown = 45;
      });
      _startResendCountdown();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Didn't receive code? ",
            style: TextStyle(color: Colors.grey, fontSize: 14),
          ),
          GestureDetector(
            onTap: _handleTap,
            child: Text(
              _resendCountdown > 0
                  ? 'Resend again (${_resendCountdown}s)'
                  : 'Resend again',
              style: TextStyle(
                color: _resendCountdown > 0 ? Colors.grey : kpimaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tareeqna/constant.dart';
import 'package:tareeqna/Features/Authentication/presentation/wedigts/custom_appbar.dart';

class AuthFormLayout extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget> fields;
  final Widget actionButton;
  final Widget? bottomLink;
  final bool showSocialButtons;
  final String? appBarTitle;
  const AuthFormLayout({
    super.key,
    required this.title,
    this.subtitle,
    required this.fields,
    required this.actionButton,
    this.bottomLink,
    this.showSocialButtons = true,
    this.appBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: appBarTitle, showLogo: true),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    if (subtitle != null && subtitle!.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        subtitle!,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          height: 1.4,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ...fields.expand((f) => [f, const SizedBox(height: 20)]),
              actionButton,
              const SizedBox(height: 30),
              if (showSocialButtons) ...[
                _buildDivider(),
                const SizedBox(height: 30),
                _buildSocialButtons(),
              ],
              if (bottomLink != null) ...[
                const SizedBox(height: 40),
                bottomLink!,
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() => Row(
    children: [
      Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Text('or', style: TextStyle(color: Colors.grey, fontSize: 14)),
      ),
      Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
    ],
  );

  Widget _buildSocialButtons() => Column(
    children: [
      _socialBtn(Icons.email, 'Sign in with Gmail', Colors.red),
      const SizedBox(height: 12),
      _socialBtn(Icons.facebook, 'Sign in with Facebook', Colors.blue),
      const SizedBox(height: 12),
      _socialBtn(Icons.apple, 'Sign in with Apple', Colors.black),
    ],
  );

  Widget _socialBtn(IconData icon, String text, Color color) => Container(
    width: double.infinity,
    height: 50,
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade300),
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

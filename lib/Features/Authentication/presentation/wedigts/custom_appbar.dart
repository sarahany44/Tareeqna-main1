import 'package:flutter/material.dart';
import 'package:tareeqna/constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final bool showLogo;
  final bool showBrandName;
  final VoidCallback? onBack;
  const CustomAppBar({
    super.key,
    this.title,
    this.showLogo = false,
    this.showBrandName = false,
    this.onBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SizedBox(
          height: 44,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: onBack ?? () => Navigator.pop(context),
                  child: const Text(
                    '< Back',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
             // SizedBox(width: 20,),

              Positioned(
                top: 25,

                child: Center(
                  child: Text(
                   
                    title ?? 'Profile',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: showLogo
                    ? Image.asset(logo, height: 30, fit: BoxFit.contain)
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

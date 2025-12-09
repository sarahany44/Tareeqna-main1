import 'package:flutter/material.dart';

class CustomProfilePictureSection extends StatelessWidget {
  final String? imagePath;
  final VoidCallback? onPickImage;
  final bool showCameraIcon;
  final bool showUserInfo;
  final String? userName;
  final String? statusText;
  final Color borderColor;
  final double size;

  const CustomProfilePictureSection({
    super.key,
    this.imagePath,
    this.onPickImage,
    this.showCameraIcon = false,
    this.showUserInfo = false,
    this.userName,
    this.statusText,
    this.borderColor = Colors.grey,
    this.size = 110,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFE8F5E8),
                  border: Border.all(color: borderColor, width: 3),
                ),
                child: imagePath == null
                    ? const Icon(Icons.person, size: 60, color: Colors.grey)
                    : ClipOval(
                        child: Image.asset(
                          imagePath!,
                          fit: BoxFit.cover,
                          width: size,
                          height: size,
                        ),
                      ),
              ),
              if (showCameraIcon)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: onPickImage,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(0, 137, 84, 0.9),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (showUserInfo && userName != null) ...[
            const SizedBox(height: 20),
            Text(
              userName!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Color(0xFF333333),
              ),
            ),
            const SizedBox(height: 8),
            if (statusText != null)
              Text(
                statusText!,
                style: const TextStyle(fontSize: 16, color: Color(0xFF666666)),
              ),
          ],
        ],
      ),
    );
  }
}

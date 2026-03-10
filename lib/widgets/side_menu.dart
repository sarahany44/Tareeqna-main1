import 'package:flutter/material.dart';
import 'package:tareeqna/Features/aboutUs/presentation/views/about_us_screen.dart';
import 'package:tareeqna/Features/help_and_support/Presentation/help_and_support.dart';
import 'package:tareeqna/constant.dart';
class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  static const Color iconColor = Colors.grey;
  static const double iconSize = 26;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(80),
        bottomRight: Radius.circular(80),
      ),
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(height: 50),
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.grey,
                      child: Icon(Icons.person, size: 35, color: Colors.white),
                    ),
                    const SizedBox(width: 15),
                    Image.asset(logo, width: 150, height: 60),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildMenuItem(context, Icons.history, 'History'),
                    _buildMenuItem(context, Icons.card_giftcard, 'Complain'),
                    _buildMenuItem(context, Icons.receipt_long, 'Referral'),
                    _buildMenuItem(context, Icons.info_outline, 'About Us',
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutUsScreen(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(context, Icons.settings_outlined, 'Settings'),
                    _buildMenuItem(context, Icons.help_outline, 'Help and Support',
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpAndSupport(),
                          ),
                        );
                      },
                    ),
                    _buildMenuItem(context, Icons.logout, 'Logout'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildMenuItem(
      BuildContext context,
      IconData icon,
      String title, {
        VoidCallback? onTap,
      }) {
    return ListTile(
      leading: Icon(icon, color: iconColor, size: iconSize),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      onTap: onTap ?? () => Navigator.pop(context),
    );
  }
}

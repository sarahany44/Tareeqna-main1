import 'package:flutter/material.dart';
import 'package:tareeqna/constant.dart';
import 'package:tareeqna/widgets/side_menu.dart';
import 'package:tareeqna/widgets/custom_app_bar.dart';
import 'package:tareeqna/Features/Wallet/Presentation/views/add_money_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const SideMenu(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
              Row(
                children: [
                  const CustomAppBar(title: ''),

                  const Expanded(child: SizedBox()),
                  Image.asset(
                    logo,
                    width: 140,
                    height: 60,
                  ),

                  const Expanded(child: SizedBox()),
                  Container(
                    width: 48,
                    height: 48,
                    child: IconButton(
                      icon: const Icon(
                        Icons.notifications_none,
                        color: Colors.black87,
                        size: 26,
                      ),
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                    MaterialPageRoute(
                    builder: (context) => const AddMoneyScreen(),
                    ),); },

                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 150,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kpimaryColor,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Add Money',
                        style: TextStyle(
                          color: kpimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

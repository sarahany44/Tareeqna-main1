import 'package:flutter/material.dart';
import 'package:tareeqna/widgets/custom_app_bar.dart';
import 'package:tareeqna/widgets/side_menu.dart';

class OfferScreen extends StatelessWidget{
  const OfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CustomAppBar(title: 'Offer'),

          ],
        ),
      ),
    );
  }
}
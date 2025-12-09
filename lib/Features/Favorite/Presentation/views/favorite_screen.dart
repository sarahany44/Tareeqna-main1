import 'package:flutter/material.dart';
import 'package:tareeqna/widgets/custom_app_bar.dart';
import 'package:tareeqna/widgets/side_menu.dart';

class FavoriteScreen extends StatelessWidget{
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: const SideMenu(),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const CustomAppBar(title: 'Favorite'),
          ],
        ),
      ),
    );
  }
}
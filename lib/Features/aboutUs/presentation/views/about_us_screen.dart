import 'package:flutter/material.dart';
import 'package:tareeqna/widgets/app_text.dart';
import 'package:tareeqna/constant.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
      child: Column(
       children: [
         const SizedBox(height: 30),
        Align(
          alignment: Alignment.topLeft,
          child: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
         AppText("About Us", fontSize: 25, fontWeight: FontWeight.bold),
         const SizedBox(height: 30),
         Padding(
           padding:  const EdgeInsets.symmetric(horizontal: 24),
           child:
        Text('Professional Rideshare Platform. Here we will '
            'provide you only interesting content, which you will'
            ' like very much. We\'re dedicated to providing you'
             'the best of Rideshare, with a focus on'
            'dependability and Earning. We\'re working to turn'
        ' our passion for Rideshare into a booming online'
        'website. We hope you enjoy our Rideshare as much as'
            'we enjoy offering them to you. I will keep'
            'posting more important posts on my Website for'
        'all of you. Please give your support and love',
          style: TextStyle(
            fontSize: 13,
            color: Colors.black87,
          ),
          textAlign: TextAlign.justify,
        ),
     ),
        const SizedBox(height: 280),
        Image.asset(
          logo,
          width: 140,
          height: 70,
        ),
      ],
    ),
    ),
    );
  }
}
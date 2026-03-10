import 'package:flutter/material.dart';
import 'package:tareeqna/widgets/app_text.dart';

import 'package:tareeqna/constant.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({Key? key}) : super(key: key);

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
            AppText("Help and Support", fontSize: 25, fontWeight: FontWeight.bold),
            const SizedBox(height: 30),
            Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 24),
              child:

              Text('Help and Support'
                'Lorem ipsum dolor sit amet consectetur. Sit'
                'pulvinar mauris mauris eu nibh semper nisl'
                'pretium laoreet. Sed non faucibus ac lectus '
                'eu arcu. Nulla sit congue facilisis vestibulum'
                'egestas nisl feugiat pharetra. Odio sit tortor'
                'morbi at orci ipsum dapibus interdum. Lorem'
                'felis est aliquet arcu nullam pellentesque. Et'
                'habitasse ac arcu et nunc euismod rhoncus'
                'facilisis sollicitudin',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 320),
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
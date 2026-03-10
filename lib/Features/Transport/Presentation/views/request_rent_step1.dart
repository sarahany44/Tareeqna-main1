import 'package:flutter/material.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/payment_method.dart';
import 'package:tareeqna/Features/Transport/Presentation/widgets/smal_car_item_card.dart';
import 'package:tareeqna/core/styles.dart';

class RequestRentStep1 extends StatefulWidget {
  const RequestRentStep1({super.key});

  @override
  State<RequestRentStep1> createState() => _RequestRentStep1State();
}

class _RequestRentStep1State extends State<RequestRentStep1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text("Request for rent")),
        leading: const BackButton(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/map.png'),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Location',
                      //  style: Styles.textStyle20.copyWith(color: Colors.black),
                      ),
                      Text(
                        '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Image.asset('assets/images/Subtract.png'),
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Office',
                       //   style: Styles.textStyle20.copyWith(
                     //       color: Colors.black,
                        //  ),
                        ),
                        Text(
                          '2972 Westheimer Rd. Santa Ana, Illinois 85486 ',
                          style: TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16),

              SmallCarItemCard(),

              SizedBox(height: 10),

           //   CustomTextField(text: 'Date'),

              SizedBox(height: 10),

            //  CustomTextField(text: 'Time'),
              SizedBox(height: 20),

              // Payment Section
              PaymentSelectionColumn(),
            ],
          ),
        ),
      ),
    );
  }
}

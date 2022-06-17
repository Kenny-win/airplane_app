import 'package:airplane_app/shared/theme.dart';
import 'package:airplane_app/ui/pages/home_page.dart';
import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SuccessCheckOutPage extends StatelessWidget {
  const SuccessCheckOutPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 300,
                height: 150,
                margin: const EdgeInsets.only(bottom: 80),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/image_success.png")
                  )
                ),
              ),
              Text(
                'Well Booked 😍',
                style: blackTextStyle.copyWith(
                  fontSize: 32,
                  fontWeight: bold
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'Are you ready to explore the new\nworld of experiences?',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: light,
                ),
                textAlign: TextAlign.center,
              ),
              CustomButton(
                width: 220,
                margin: const EdgeInsets.only(top: 50),
                title: 'My Bookings', 
                onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
                }
              )
            ],
          ),
        ),
      )
    );
  }
}
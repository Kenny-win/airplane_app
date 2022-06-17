import 'package:airplane_app/shared/theme.dart';
import 'package:airplane_app/ui/pages/checkout_page.dart';
import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:airplane_app/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';

class ChooseSeatPage extends StatefulWidget {
  const ChooseSeatPage({ Key? key }) : super(key: key);

  @override
  State<ChooseSeatPage> createState() => _ChooseSeatPageState();
}

class _ChooseSeatPageState extends State<ChooseSeatPage> {
  var isChoose = false; 
  var tmp = -1;
  var toChoice = 0;
  @override
  Widget build(BuildContext context) {

    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          'Select Your\nFavourite Seat',
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // NOTE: AVAILABLE
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(right: 6),
              decoration: const BoxDecoration(
                image:DecorationImage(
                  image: AssetImage(
                    'assets/icon_available.png',
                  )
                )
              ),
            ),
            Text(
              'Available',
              style: blackTextStyle,
            ),
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(left:10, right: 6),
              decoration: const BoxDecoration(
                image:DecorationImage(
                  image: AssetImage(
                    'assets/icon_selected.png',
                  )
                )
              ),
            ),
            Text(
              'Selected',
              style: blackTextStyle,
            ),
            Container(
              width: 16,
              height: 16,
              margin: const EdgeInsets.only(left: 10, right: 6),
              decoration: const BoxDecoration(
                image:DecorationImage(
                  image: AssetImage(
                    'assets/icon_unavailable.png',
                  )
                )
              ),
            ),
            Text(
              'Unavailable',
              style: blackTextStyle,
            ),
          ],
        )
      );
    }

    Widget selectSeat() {
      final List abj = ['A', 'B', '', 'C', 'D'];

      Widget seatAbjad(String abjad) {
        return Container(
          width: 48,
          height: 48,
          child: Center(
            child: Text(
                abjad,
                style: greyTextStyle.copyWith(
                  fontSize: 16
                )
            ),
          ),
        );
      } 

      return Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(abj.length, (index) => 
                seatAbjad(abj[index])
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 2),
                  SeatItem(status: 2),
                  seatAbjad("1"),
                  SeatItem(status: 0),
                  SeatItem(status: 2),
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                  seatAbjad("2"),
                  SeatItem(status: 0),
                  SeatItem(status: 2),
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 1),
                  SeatItem(status: 1),
                  seatAbjad("3"),
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 0),
                  SeatItem(status: 2),
                  seatAbjad("4"),
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SeatItem(status: 0),
                  SeatItem(status: 0),
                  seatAbjad("5"),
                  SeatItem(status: 2),
                  SeatItem(status: 0),
                ],
              )
            ),

            // NOTE: YOUR SEAT
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Seat',
                    style: greyTextStyle.copyWith(
                      fontWeight: light 
                    ),
                  ),
                  Text(
                    'A3, B3',
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium
                    )
                  )
                ],
              )
            ),

            // NOTE: TOTAL
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: greyTextStyle.copyWith(
                      fontWeight: light 
                    ),
                  ),
                  Text(
                    'IDR 540.000.000',
                    style: purpleTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold
                    )
                  )
                ],
              )
            )
          ],
        ),
      );
    }

    Widget checkOutButton() {
      return CustomButton(
        title: "Continue to Checkout",
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const CheckoutPage()));
        },
        margin: const EdgeInsets.only(
          top: 30,
          bottom: 46
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            title(),
            seatStatus(),
            selectSeat(),
            checkOutButton(),
          ],
        ),
      )
    );
  }
}
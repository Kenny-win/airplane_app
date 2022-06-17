import 'package:airplane_app/shared/theme.dart';
import 'package:airplane_app/ui/pages/success_checkout_page.dart';
import 'package:airplane_app/ui/widgets/booking_details_item.dart';
import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget route() {
      return Container(
        margin:  const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              width: 325,
              height: 65,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/image_checkout.png"
                  )
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CGK',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold
                      ),
                    ),
                    Text(
                      'Tangerang',
                      style: greyTextStyle.copyWith(
                        fontWeight: light
                      )
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'TLC',
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold
                      ),
                    ),
                    Text(
                      'Ciliwung',
                      style: greyTextStyle.copyWith(
                        fontWeight: light
                      )
                    )
                  ],
                )
              ],
            ),
          ],
        )
      );
    }

    Widget bookingDetails() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // NOTE: DESTINATION TILE
            Row(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/image_destination1.png")
                    )
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lake Ciliwung",
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: medium
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Tangerang',
                        style: greyTextStyle.copyWith(
                          fontWeight: light
                        )
                      )
                    ],
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 2),
                      child: const Icon(
                        Icons.star_rounded,
                        color: Colors.orange,
                        size: 20,
                      )
                    ),
                    Text(
                      '4.8',
                      style: blackTextStyle.copyWith(
                        fontWeight: medium
                      ),
                    )
                  ],
                ),
              ],
            ),
            // NOTE: BOOKING DETAILS
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text(
                'Booking Details',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semiBold
                )
              )
            ),
            // NOTE: BOOKING DETAILS TEXT
            BookingDetailsItem(
              title: 'Traveler',
              valueText: '2 person',
              valueColor: kBlackColor,
            ),
            BookingDetailsItem(
              title: 'Seat',
              valueText: 'A3, B3',
              valueColor: kBlackColor,
            ),
            BookingDetailsItem(
              title: 'Insurance',
              valueText: 'YES',
              valueColor: kGreenColor,
            ),
            BookingDetailsItem(
              title: 'Refundable',
              valueText: 'NO',
              valueColor: kRedColor,
            ),
            BookingDetailsItem(
              title: 'VAT',
              valueText: '45%',
              valueColor: kBlackColor,
            ),
            BookingDetailsItem(
              title: 'Price',
              valueText: 'IDR 8.500.690',
              valueColor: kBlackColor,
            ),
            BookingDetailsItem(
              title: 'Grand Total',
              valueText: 'IDR 12.000.000',
              valueColor: kPrimaryColor,
            ),
          ],
        ),
      );
    }

    Widget paymentDetails() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Payment Details',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16),
                    width: 100,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image_card.png")
                      )
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: const EdgeInsets.only(right: 6),
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/icon_plane.png"),
                              ),
                            ),
                          ),
                          Text(
                            'Pay',
                            style: whiteTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: medium
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IDR 80.400.000',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          'Current Balance',
                          style: greyTextStyle.copyWith(
                            fontWeight: light
                          )
                        )
                      ],
                    )
                  )
                ],
              )
            )
          ],
        ),
      );
    }

    Widget payNowButton() {
      return CustomButton(
        title: 'Pay Now', 
        margin: const EdgeInsets.only(bottom: 30),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> const SuccessCheckOutPage()));
        }
      );
    }

    Widget tacButton() {
      return Container(
        margin: const EdgeInsets.only(top: 5, bottom: 30),
        child: TextButton(
          onPressed: (){},
          child: Text(
            'Terms and Conditions',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline
            )
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: kBackgroundColor,
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            route(),
            bookingDetails(),
            paymentDetails(),
            payNowButton(),
            tacButton()
          ],
        ),
      ),
    );
  }
}
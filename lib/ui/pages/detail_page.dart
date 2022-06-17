import 'package:airplane_app/shared/detail_data.dart';
import 'package:airplane_app/shared/theme.dart';
import 'package:airplane_app/ui/pages/choose_seat_page.dart';
import 'package:airplane_app/ui/widgets/custom_button.dart';
import 'package:airplane_app/ui/widgets/interest_item.dart';
import 'package:airplane_app/ui/widgets/photo_item.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget backgroundImage() {
      return Container(
          width: double.infinity,
          height: 450,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image_destination1.png"))));
    }

    Widget customShadow() {
      return Container(
        width: double.infinity,
        height: 214,
        margin: const EdgeInsets.only(top: 236),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kWhiteColor.withOpacity(0),
                Colors.black.withOpacity(0.95)
              ]),
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          children: [
            // NOTE: EMBLEM
            Container(
              width: 100,
              height: 24,
              margin: const EdgeInsets.only(top: 30),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/icon_emblem.png'))),
            ),
            // NOTE: TITLE
            Container(
              margin: const EdgeInsets.only(top: 256),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lake Ciliwung',
                        style: whiteTextStyle.copyWith(
                            fontSize: 24, fontWeight: semiBold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'Tangerang',
                        style: whiteTextStyle.copyWith(
                            fontSize: 16, fontWeight: light),
                      ),
                    ],
                  )),
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
                          )),
                      Text(
                        '4.8',
                        style: whiteTextStyle.copyWith(fontWeight: medium),
                      )
                    ],
                  )
                ],
              ),
            ),
            // NOTE: DESCRIPTION
            Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(18)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // NOTE: ABOUT
                    Text(
                      'About',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      'Berada di jalur jalan provinsi yang menghubungkan Denpasar Singaraja serta letaknya yang dekat dengan Kebun Raya Eka Karya menjadikan tempat Bali.',
                      style: blackTextStyle.copyWith(height: 1.5),
                    ),
                    // NOTE: PHOTOS
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Photos',
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semiBold),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: detailData
                          .map<Widget>((itemOfData) =>
                              PhotoItem(imageUrl: itemOfData["url"]))
                          .toList(),
                    ),
                    // NOTE: INTERESTS
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Interests',
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        )),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(children: [
                      InterestItem(title: interest[0]['title']),
                      InterestItem(title: interest[1]['title']),
                    ]),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(children: [
                      InterestItem(title: interest[2]['title']),
                      InterestItem(title: interest[3]['title']),
                    ]),
                  ],
                )),
            // NOTE: PRICE AND BOOK BUTTON
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  // PRICE
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'IDR 2.500.000',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: medium
                          ),
                        ),
                        const SizedBox(height: 5,),
                        Text(
                          'per orang',
                          style: greyTextStyle.copyWith(
                            fontWeight: light
                          ),
                        ),
                      ],
                    )
                  ),

                  // NOTE: BOOK BUTTON
                  CustomButton(
                    title: 'Book Now',
                    onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> const ChooseSeatPage())),
                    width: 170,
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: kWhiteColor,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            backgroundImage(),
            customShadow(),
            content(),
          ],
        )),
    ));
  }
}

import 'package:airplane_app/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';

import 'package:airplane_app/shared/theme.dart';

class DestinationCard extends StatelessWidget {
  final String name;
  final String city;
  final String imageUrl;
  final double rating;

  const DestinationCard({
    Key? key,
    required this.name,
    required this.city,
    required this.imageUrl,
    this.rating = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const DetailPage())),
      child: Container(
        width: 200,
        height: 323,
        margin: EdgeInsets.only(left: defaultMargin),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: kWhiteColor
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 180,
              height: 220,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: AssetImage(
                    imageUrl,
                  )
                )
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 55,
                  height: 30,
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(18)
                    ) 
                  ),
                  child: Row(
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
                        rating.toString(),
                        style: blackTextStyle.copyWith(
                          fontWeight: medium
                        ),
                      )
                    ],
                  ),
                )
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: medium
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    city,
                    style: blackTextStyle.copyWith(
                      fontWeight: light
                    ),
                  )
                ]
              )
            )
          ],
        ),
      )
    );
  }
}

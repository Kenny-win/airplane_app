import 'package:airplane_app/ui/pages/detail_page.dart';
import 'package:flutter/material.dart';

import 'package:airplane_app/shared/theme.dart';

class DestinationTile extends StatelessWidget {
  final String name;
  final String city;
  final String imageUrl;
  final double rating;
  const DestinationTile({
    Key? key,
    required this.name,
    required this.city,
    required this.imageUrl,
    this.rating = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const DetailPage())),
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kWhiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl)
                )
              ),
            ),
            Expanded(
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
                  rating.toString(),
                  style: blackTextStyle.copyWith(
                    fontWeight: medium
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}

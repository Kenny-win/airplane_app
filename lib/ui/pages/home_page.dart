import 'package:airplane_app/cubit/auth_cubit.dart';
import 'package:airplane_app/shared/destination_data.dart';
import 'package:airplane_app/shared/theme.dart';
import 'package:airplane_app/ui/widgets/destination_card.dart';
import 'package:airplane_app/ui/widgets/destination_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget header() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSuccess) {
            return Container(
              margin: EdgeInsets.only(
                  left: defaultMargin, right: defaultMargin, top: 30),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Howdy,\n${state.user.name}',
                        style: blackTextStyle.copyWith(
                            fontWeight: semiBold, fontSize: 24),
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Where to fly today ?',
                        style: greyTextStyle.copyWith(
                            fontSize: 16, fontWeight: light),
                      )
                    ],
                  )),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage('assets/image_profile.png'))),
                  )
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    Widget popularDestination() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: SingleChildScrollView(
            physics: const ScrollPhysics(
                parent: BouncingScrollPhysics(
                    parent: ScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()))),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  destinationCard.length,
                  (index) => DestinationCard(
                        name: destinationCard[index]['name'],
                        city: destinationCard[index]['kota'],
                        imageUrl: destinationCard[index]['url'],
                        rating: destinationCard[index]['rating'],
                      )),
            )),
      );
    }

    Widget newThisYearText() => Padding(
        padding:
            EdgeInsets.only(top: 30, left: defaultMargin, right: defaultMargin),
        child: Text('New This Year',
            style:
                blackTextStyle.copyWith(fontSize: 18, fontWeight: semiBold)));

    Widget newDestination() {
      return Container(
        margin: EdgeInsets.only(
            left: defaultMargin, right: defaultMargin, bottom: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              destinationTile.length,
              (index) => DestinationTile(
                    name: destinationTile[index]['name'],
                    city: destinationTile[index]['kota'],
                    imageUrl: destinationTile[index]['url'],
                    rating: destinationTile[index]['rating'],
                  )),
        ),
      );
    }

    return ListView(
        physics: const ScrollPhysics(
            parent: BouncingScrollPhysics(
                parent:
                    ScrollPhysics(parent: AlwaysScrollableScrollPhysics()))),
        children: [
          header(),
          popularDestination(),
          newThisYearText(),
          newDestination(),
        ]);
  }
}

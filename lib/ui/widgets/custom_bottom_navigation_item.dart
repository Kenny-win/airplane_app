import 'package:airplane_app/cubit/page_cubit.dart';
import 'package:airplane_app/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBottomNavigationItem extends StatefulWidget {
  final String imageUrl;
  final int index;
  const CustomBottomNavigationItem({
    Key? key, 
    required this.imageUrl, 
    required this.index
  }) : super(key: key);

  @override
  State<CustomBottomNavigationItem> createState() => _CustomBottomNavigationItemState();
}

class _CustomBottomNavigationItemState extends State<CustomBottomNavigationItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(context.read<PageCubit>().state == widget.index);
        context.read<PageCubit>().setPage(widget.index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Image.asset(widget.imageUrl,  width: 24, height: 24, color: context.read<PageCubit>().state==widget.index?kPrimaryColor:kGreyColor,),
          Container(
            width: 30,
            height: 2,
            decoration: BoxDecoration(
              color: context.read<PageCubit>().state==widget.index?kPrimaryColor:kTransparentColor, 
              borderRadius: BorderRadius.circular(18)
            ),
          )
        ],
      )
    );
  }
}

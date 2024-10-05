// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:car_rental_app/core/colors/colors.dart';
import 'package:ionicons/ionicons.dart';

class OrderListItemCardWidget extends StatefulWidget {
  String name;
  String model;
  String type;
  String image;
  num price;
  int seat;
  num rate;
  OrderListItemCardWidget({
    Key? key,
    required this.name,
    required this.model,
    required this.type,
    required this.image,
    required this.price,
    required this.seat,
    required this.rate,
  }) : super(key: key);

  @override
  State<OrderListItemCardWidget> createState() =>
      _OrderListItemCardWidgetState();
}

class _OrderListItemCardWidgetState extends State<OrderListItemCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.27,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: ThemeColors.lightPrimary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ThemeColors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
              height: 170,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.name,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: ThemeColors.black,
                          ),
                        ),
                        Text(
                          "Due on 11 sep, 2023",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: ThemeColors.grey,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: ThemeColors.lightGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          'compledted',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: ThemeColors.openColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

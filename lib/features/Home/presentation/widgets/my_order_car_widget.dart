// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:car_rental_app/core/colors/colors.dart';
import 'package:ionicons/ionicons.dart';

class MyOrderCarsCardWidget extends StatefulWidget {
  String name;
  String model;
  String type;
  String image;
  num price;
  int seat;
  num rate;
  MyOrderCarsCardWidget({
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
  State<MyOrderCarsCardWidget> createState() => _MyOrderCarsCardWidgetState();
}

class _MyOrderCarsCardWidgetState extends State<MyOrderCarsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.12,
      width: MediaQuery.of(context).size.width * 0.7,
      decoration: BoxDecoration(
        color: ThemeColors.lightPrimary,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: ThemeColors.grey.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              widget.image,
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.125,
              width: MediaQuery.of(context).size.width * 0.35,
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.name,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: ThemeColors.primary,
                  ),
                ),
                Text(
                  'Due on 11 sep, 2023',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: ThemeColors.grey,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Ionicons.person_outline,
                          color: ThemeColors.primary,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "Kofi Neka",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: ThemeColors.black,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
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
                            fontSize: 10,
                            color: ThemeColors.openColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.phone_outlined,
                      color: ThemeColors.primary,
                      size: 16,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      "+251987654321",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        color: ThemeColors.black,
                      ),
                    ),
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

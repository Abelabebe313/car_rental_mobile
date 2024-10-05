// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:car_rental_app/core/colors/colors.dart';
import 'package:ionicons/ionicons.dart';

class CarsCardWidget extends StatefulWidget {
  String name;
  String model;
  String type;
  String image;
  num price;
  int seat;
  num rate;
  CarsCardWidget({
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
  State<CarsCardWidget> createState() => _CarsCardWidgetState();
}

class _CarsCardWidgetState extends State<CarsCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.15,
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
              height: 140,
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
                    Text(
                      widget.name,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: ThemeColors.black,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          Ionicons.star,
                          color: ThemeColors.primary,
                          size: 16,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          widget.rate.toString(),
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: ThemeColors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  "${widget.model} . ${widget.type}" ?? "",
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
                          Icons.chair_rounded,
                          color: ThemeColors.primary,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${widget.seat} Seats",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: ThemeColors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(
                          Ionicons.cash_outline,
                          color: ThemeColors.primary,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "${widget.price}",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: ThemeColors.black,
                          ),
                        ),
                      ],
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

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:car_rental_app/core/colors/colors.dart';
import 'package:car_rental_app/features/Home/presentation/pages/select_time_&_date.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:intl/intl.dart';

class CarDetial extends StatefulWidget {
  String name;
  String model;
  String type;
  String image;
  num price;
  int seat;
  num rate;
  CarDetial({
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
  State<CarDetial> createState() => _CarDetialState();
}

class _CarDetialState extends State<CarDetial> {
  DateTime? _rentalStart;
  DateTime? _rentalReturn;
  // Callback function to handle the selected date and time
  void _handleDateTimeSelection(DateTime start, DateTime end) {
    setState(() {
      _rentalStart = start;
      _rentalReturn = end;
    });
  }

  // Formatting Date and Time
  String _formatDate(DateTime dateTime) {
    return DateFormat('dd MMM, EEE').format(dateTime);
  }

  String _formatTime(DateTime dateTime) {
    return DateFormat('hh:mm a').format(dateTime); // 12-hour format with AM/PM
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.lightPrimary,
      appBar: AppBar(
        backgroundColor: ThemeColors.lightPrimary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Rent Detail',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: ThemeColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: MediaQuery.of(context).size.width * 0.35,
                  ),
                ),
                const SizedBox(width: 10),
                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.name,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: ThemeColors.primary,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: ThemeColors.openColor,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${widget.rate} - 139 Trips",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: ThemeColors.grey,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Icon(
                            Icons.attach_money_outlined,
                            color: ThemeColors.primary,
                            size: 18,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "${widget.price}/hr",
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
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
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Rent Data',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: ThemeColors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SelectTimeAndDateScreen(
                    onDateSelected: _handleDateTimeSelection,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.125,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: ThemeColors.lightBlue,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _rentalStart != null
                              ? _formatDate(_rentalStart!)
                              : 'Start Date',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: ThemeColors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _rentalStart != null
                              ? _formatTime(_rentalStart!)
                              : 'Start Time',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: ThemeColors.grey,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: ThemeColors.black,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _rentalReturn != null
                              ? _formatDate(_rentalReturn!)
                              : 'End Date',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: ThemeColors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _rentalReturn != null
                              ? _formatTime(_rentalReturn!)
                              : 'End Time',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: ThemeColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Payment Details',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: ThemeColors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ThemeColors.lightBlue,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Start Date',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: ThemeColors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '11,054.4 birr',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: ThemeColors.black,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: ThemeColors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '-',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: ThemeColors.grey,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Amount',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: ThemeColors.grey,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '11,054.4 birr',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: ThemeColors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            height: MediaQuery.of(context).size.height * 0.09,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ThemeColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '11,054.4 birr',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: ThemeColors.lightPrimary,
                      ),
                    ),
                    Text(
                      'Total Amount',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: ThemeColors.grey,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ThemeColors.openColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(150, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Text(
                    'Proceed to Payment',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

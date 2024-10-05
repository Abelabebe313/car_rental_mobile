import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';
import 'package:car_rental_app/core/colors/colors.dart';

class SelectTimeAndDateScreen extends StatefulWidget {
  final Function(DateTime, DateTime) onDateSelected;

  SelectTimeAndDateScreen({
    Key? key,
    required this.onDateSelected,
  }) : super(key: key);

  @override
  State<SelectTimeAndDateScreen> createState() =>
      _SelectTimeAndDateScreenState();
}

class _SelectTimeAndDateScreenState extends State<SelectTimeAndDateScreen> {
  DateTime? _startDate;
  DateTime? _returnDate;
  double _startHour = 9.0;
  double _returnHour = 18.0;

  // Function to format the slider value as a time
  String _formatTime(double value) {
    final int hour = value.floor();
    final int minute = ((value - hour) * 60).round();
    final time = TimeOfDay(hour: hour, minute: minute);
    return time.format(context);
  }

  // Callback function when Save button is pressed
  void _onSave() {
    if (_startDate != null && _returnDate != null) {
      final startDateTime = DateTime(
        _startDate!.year,
        _startDate!.month,
        _startDate!.day,
        _startHour.toInt(),
        ((_startHour - _startHour.toInt()) * 60).toInt(),
      );

      final returnDateTime = DateTime(
        _returnDate!.year,
        _returnDate!.month,
        _returnDate!.day,
        _returnHour.toInt(),
        ((_returnHour - _returnHour.toInt()) * 60).toInt(),
      );

      widget.onDateSelected(startDateTime, returnDateTime);
      Navigator.pop(context);
    }
  }

  // Method to handle date range selection
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      setState(() {
        _startDate = args.value.startDate;
        _returnDate = args.value.endDate ??
            args.value.startDate; // Handle single date selection case
      });
    }
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
          'Select Trip Date & Time',
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
          const SizedBox(height: 10),
          // Display selected dates and times
          Container(
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
                      _startDate != null
                          ? DateFormat('dd MMM, EEE').format(_startDate!)
                          : 'Select Date',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: ThemeColors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _formatTime(_startHour), // Display start time from slider
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
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
                      _returnDate != null
                          ? DateFormat('dd MMM, EEE').format(_returnDate!)
                          : 'Select Date',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: ThemeColors.black,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _formatTime(
                          _returnHour), // Display return time from slider
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: ThemeColors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          // Syncfusion Date Range Picker for selecting start and end dates
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.39,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ThemeColors.lightPrimary,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: ThemeColors.grey.withOpacity(0.2),
                  width: 1,
                ),
              ),
              child: SfDateRangePicker(
                headerStyle: DateRangePickerHeaderStyle(
                  backgroundColor: ThemeColors.lightPrimary,
                  textAlign: TextAlign.center,
                  textStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: ThemeColors.primary,
                  ),
                ),
                backgroundColor: ThemeColors.lightPrimary,
                selectionMode: DateRangePickerSelectionMode.range,
                onSelectionChanged: _onSelectionChanged,
                initialSelectedRange: PickerDateRange(
                  _startDate,
                  _returnDate,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          // Time selector buttons for start and end time
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Pickup',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: _startHour,
                        min: 0,
                        max: 23.99,
                        divisions:
                            24 * 4, // 24 hours, divided into 15-minute increments
                        label: _formatTime(_startHour),
                        onChanged: (double value) {
                          setState(() {
                            _startHour = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'Return',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                    Expanded(
                      child: Slider(
                        value: _returnHour,
                        min: 0,
                        max: 23.99,
                        divisions:
                            24 * 4, // 24 hours, divided into 15-minute increments
                        label: _formatTime(_returnHour),
                        onChanged: (double value) {
                          setState(() {
                            _returnHour = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          // Save button
          Container(
            height: MediaQuery.of(context).size.height * 0.12,
            width: double.infinity,
            decoration: BoxDecoration(
              color: ThemeColors.primary,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(
              child: ElevatedButton(
                onPressed: _onSave,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: ThemeColors.openColor,
                  foregroundColor: Colors.white,
                  minimumSize:
                      Size(MediaQuery.of(context).size.width * 0.75, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Save',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

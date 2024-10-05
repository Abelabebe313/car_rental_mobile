import 'package:car_rental_app/core/colors/colors.dart';
import 'package:car_rental_app/features/Home/data/models/cars_model.dart';
import 'package:car_rental_app/features/Home/presentation/pages/car_detail_page.dart';
import 'package:car_rental_app/features/Home/presentation/widgets/available_car_widget.dart';
import 'package:car_rental_app/features/Home/presentation/widgets/my_order_car_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedFilter = "All";

  // List of filter options
  final List<String> _filters = ["Recent", "All"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Available Cars',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: ThemeColors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See more',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: ThemeColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.27,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: carsData.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarDetial(
                            name: carList[index].name ?? "",
                            model: carList[index].model ?? "",
                            type: carList[index].type ?? "",
                            image: carList[index].image ?? "",
                            price: carList[index].price ?? 0.0,
                            seat: carList[index].seat ?? 0,
                            rate: carList[index].rate ?? 0.0,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: CarsCardWidget(
                        name: carList[index].name ?? "",
                        model: carList[index].model ?? "",
                        type: carList[index].type ?? "",
                        image: carList[index].image ?? "",
                        price: carList[index].price ?? 0.0,
                        seat: carList[index].seat ?? 0,
                        rate: carList[index].rate ?? 0.0,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Orders',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: ThemeColors.black,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'View All',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: ThemeColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Wrap(
                spacing: 8.0,
                children: _filters.map((filter) {
                  return ChoiceChip(
                    label: Text(filter),
                    selected: _selectedFilter == filter,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    selectedColor: ThemeColors.primary,
                    onSelected: (bool isSelected) {
                      setState(() {
                        _selectedFilter = filter;
                      });
                    },
                    labelStyle: TextStyle(
                      color: _selectedFilter == filter
                          ? Colors.white
                          : Colors.black,
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: carsData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: MyOrderCarsCardWidget(
                      name: carList[index].name ?? "",
                      model: carList[index].model ?? "",
                      type: carList[index].type ?? "",
                      image: carList[index].image ?? "",
                      price: carList[index].price ?? 0.0,
                      seat: carList[index].seat ?? 0,
                      rate: carList[index].rate ?? 0.0,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final List<CarModel> carList =
    carsData.map((json) => CarModel.fromJson(json)).toList();
// dummy data
List carsData = [
  {
    "id": "1",
    "name": "Maserati",
    "model": "2021",
    "price": 28.56,
    "rate": 5.00,
    "seat": 2,
    "type": "sport",
    "image": "assets/images/maserati.jpg",
    "description": "",
  },
  {
    "id": "2",
    "name": "BMW",
    "model": "2021",
    "price": 28.56,
    "rate": 4.50,
    "seat": 5,
    "type": "Sedan",
    "image": "assets/images/bmw.jpg",
    "description": "",
  },
  {
    "id": "3",
    "name": "Mercedes-Benz",
    "model": "2021",
    "price": 1.57,
    "rate": 4.50,
    "seat": 5,
    "type": "Sedan",
    "image": "assets/images/mercedes.jpg",
    "description": "",
  },
  {
    "id": "4",
    "name": "Audi",
    "model": "2021",
    "price": 1.04,
    "rate": 4.50,
    "seat": 7,
    "type": "SUV",
    "image": "assets/images/audi.jpg",
    "description": "",
  },
  {
    "id": "5",
    "name": "Toyota Tundra",
    "model": "2021",
    "price": 1.15,
    "rate": 4.50,
    "seat": 7,
    "type": "SUV",
    "image": "assets/images/toyota.jpg",
    "description": "",
  },
  {
    "id": "6",
    "name": "Hyundai",
    "model": "2021",
    "price": 1.05,
    "rate": 4.50,
    "seat": 5,
    "type": "SUV",
    "image": "assets/images/hyundai.jpg",
    "description": "",
  },
  {
    "id": "7",
    "name": "Mitsubishi",
    "model": "2021",
    "price": 54.42,
    "rate": 4.50,
    "seat": 5,
    "type": "Pickup",
    "image": "assets/images/mitsubishi.jpg",
    "description": "",
  },
  {
    "id": "8",
    "name": "Jeep",
    "model": "2021",
    "price": 62.90,
    "rate": 4.50,
    "seat": 5,
    "type": "SUV",
    "image": "assets/images/jeepsuv.jpg",
    "description": "",
  },
];

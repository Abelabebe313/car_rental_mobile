import 'package:car_rental_app/core/colors/colors.dart';
import 'package:car_rental_app/features/Home/data/models/cars_model.dart';
import 'package:car_rental_app/features/Cars/presentation/widgets/car_listing_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CarListingScreen extends StatefulWidget {
  const CarListingScreen({super.key});

  @override
  State<CarListingScreen> createState() => _CarListingScreenState();
}

class _CarListingScreenState extends State<CarListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.85,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: carsData.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CarsListPageCardWidget(
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

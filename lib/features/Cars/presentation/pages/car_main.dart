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
  // Search query controller
  TextEditingController _searchController = TextEditingController();

  // List of cars for display (filtered)
  List<CarModel> _filteredCarList = [];

  @override
  void initState() {
    super.initState();
    // Initially, all cars are shown
    _filteredCarList = carList;
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  // Method to handle changes in search query
  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      // Filter car list based on the query (search by name or model)
      _filteredCarList = carList.where((car) {
        return car.name!.toLowerCase().contains(query) ||
            car.model!.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Search bar at the top
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by name or model',
                hintStyle: GoogleFonts.inter(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: ThemeColors.grey,
                ),
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Car listing with filtered data
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: _filteredCarList.length,
                itemBuilder: (context, index) {
                  final car = _filteredCarList[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: CarsListPageCardWidget(
                      name: car.name ?? '',
                      model: car.model ?? '',
                      type: car.type ?? '',
                      image: car.image ?? '',
                      price: car.price ?? 0.0,
                      seat: car.seat ?? 0,
                      rate: car.rate ?? 0.0,
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

// List of cars (initial data)
final List<CarModel> carList =
    carsData.map((json) => CarModel.fromJson(json)).toList();

// Dummy data for the cars
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

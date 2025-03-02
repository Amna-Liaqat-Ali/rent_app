import 'package:flutter/material.dart';
import 'package:rent_app/data/models/car.dart';
import 'package:rent_app/presentation/pages/car_detail_page.dart';

class CarCard extends StatelessWidget {
  final Car car;

  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CarDetailPage(
                    car: Car(
                        model: car.model,
                        distance: car.distance,
                        fuelCapacity: car.fuelCapacity,
                        pricePerHour: car.pricePerHour))));
      },
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, blurRadius: 10, spreadRadius: 5)
              ]),
          child: Column(children: [
            Image.asset(
              'assets/car.jpeg',
              height: 120,
            ),
            Text(
              car.model,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        //Image.asset('assets/gps.png'),
                        Text('${car.distance}km')
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Row(
                      children: [
                        //Image.asset('assets/pump.png'),
                        Text('${car.fuelCapacity}L')
                      ],
                    )
                  ],
                ),
                Text(
                  '\$${car.pricePerHour}/h',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
          ])),
    );
  }
}

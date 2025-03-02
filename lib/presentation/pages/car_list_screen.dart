import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_app/presentation/bloc/car_state.dart';
import 'package:rent_app/presentation/widgets/car_card.dart';

import '../bloc/car_bloc.dart';

class CarListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Choose Your Car')),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: BlocBuilder<CarBloc, CarState>(
          builder: (context, state) {
            if (state is CarLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CarLoaded) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return CarCard(car: state.cars[index]);
                },
                itemCount: state.cars.length,
              );
            } else if (state is CarError) {
              return Center(
                child: Text("error:${state.message}"),
              );
            }
            return Container();
          },
        ));
  }
}

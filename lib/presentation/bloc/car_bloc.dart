import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_app/domain/usecases/get_cars.dart';
import 'package:rent_app/presentation/bloc/car_event.dart';
import 'package:rent_app/presentation/bloc/car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars getCars;

  CarBloc({required this.getCars}) : super(CarLoading()) {
    on<LoadCars>((event, emit) async {
      emit(CarLoading());
      try {
        final cars = await getCars.call();
        emit(CarLoaded(cars));
      } catch (e) {
        emit(CarError(e.toString()));
      }
    });
  }
}

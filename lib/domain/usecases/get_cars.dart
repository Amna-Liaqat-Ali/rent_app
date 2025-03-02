import 'package:rent_app/data/models/car.dart';
import 'package:rent_app/domain/repositries/car_repo.dart';

class GetCars {
  final CarRepo repository;

  GetCars(this.repository);

  Future<List<Car>> call() async {
    return await repository.fetchCars();
  }
}

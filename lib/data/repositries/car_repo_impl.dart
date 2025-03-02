import 'package:rent_app/data/datasources/firebase_car_data_source.dart';
import 'package:rent_app/data/models/car.dart';
import 'package:rent_app/domain/repositries/car_repo.dart';

class CarRepoImpl implements CarRepo {
  final FirebaseCarDataSource dataSource;

  CarRepoImpl(this.dataSource);

  @override
  Future<List<Car>> fetchCars() {
    return dataSource.getCars();
  }
}

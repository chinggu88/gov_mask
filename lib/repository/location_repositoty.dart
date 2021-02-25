import 'package:geolocator/geolocator.dart';

class LocationRepository{
  final _geolocator = Geolocator();
  
  Future<Position> getCurrentLocaiton() async{
    Position position = 
    await _geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    return position;
  }
}
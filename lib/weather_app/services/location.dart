import 'package:geolocator/geolocator.dart';

class Location{
  double longitude;
  double latitude;

  Future<void> getCurrentLocation() async{
    try{
      Position position = await getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
      // print(position);
      latitude = position.latitude;
      longitude = position.longitude ;
    }catch(e){
      print("Error Location not found");
    }
  }
}
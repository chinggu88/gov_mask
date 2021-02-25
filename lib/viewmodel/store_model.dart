import 'package:flutter/cupertino.dart';
import 'package:flutter_mask/model/store.dart';
import 'package:flutter_mask/repository/location_repositoty.dart';
import 'package:flutter_mask/repository/store_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class StoreModel with ChangeNotifier{
    List<Store> stores = [];
    var isLoading = false;
    final _storerepository = StoreRepository();
    final _locationrepository = LocationRepository();

  StoreModel(){
    fetch();
  }

    Future fetch() async{
      isLoading=true;
      notifyListeners();
      Position position = await _locationrepository.getCurrentLocaiton();
      
      stores = await _storerepository.fetch(
          position.latitude, 
          position.longitude
        );
        
      isLoading=false;
      notifyListeners();
    }
}
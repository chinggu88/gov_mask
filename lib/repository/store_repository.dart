import 'dart:convert';
import 'package:flutter_mask/model/store.dart';
import 'package:http/http.dart' as https;
import 'package:latlong/latlong.dart';

class StoreRepository{
  
  Future<List<Store>> fetch(double lat, double lng) async{
  final storeList = List<Store>();
  final _distance = Distance();
    var url = "https://8oi9s0nnth.apigw.ntruss.com/corona19-masks/v1/storesByGeo/json?lat=$lat&lng=$lng&m=5000";
    var response = await https.get(url);
    
        final jsonResult = jsonDecode(utf8.decode(response.bodyBytes));
        final jsonStores = jsonResult['stores'];
      
          jsonStores.forEach((e){
            final store = Store.fromJson(e);
            final km = _distance.as(LengthUnit.Kilometer, LatLng(store.lat,store.lng), LatLng(lat,lng));
            store.km = km;
            storeList.add(store);
          });
          print('fetch 완료');

        return storeList.where((e){
              return e.remainStat == 'plenty' ||
              e.remainStat == 'some' ||
              e.remainStat == 'few';
            }).toList()..sort((a,b) => a.km.compareTo(b.km));
      
    }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mask/ui/widget/loadingwidet.dart';
import 'package:flutter_mask/ui/widget/remain_stat_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mask/viewmodel/store_model.dart';

class MainPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final storemodel = Provider.of<StoreModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('마스크 재고 있는 곳 :  ${storemodel.stores.length} 곳'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.refresh), 
              onPressed: (){
                  storemodel.fetch();
              },
            )
        ],
      ),
      body: storemodel.isLoading ? loadingwidet().loadingWidget() : ListView(
        children: storemodel.stores
          .where((e) => e.remainStat == 'plenty' || e.remainStat == 'some' || e.remainStat == 'few')
            .map((e) {
              return RemainStatListTile(e);
            }).toList(),
            
      ),
    );
  }
 
  
}


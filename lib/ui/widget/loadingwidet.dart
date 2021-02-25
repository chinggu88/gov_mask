import 'package:flutter/material.dart';

class loadingwidet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return loadingWidget();
  }

  Widget loadingWidget(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('정보를 가져오는중'),
          Padding(padding: EdgeInsets.only(top: 10)),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
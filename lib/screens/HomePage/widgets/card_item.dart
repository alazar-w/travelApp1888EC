import 'package:flutter/material.dart';
import 'package:travelapp/helper/constants.dart';

class CardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData media;
    media = MediaQuery.of(context);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4.0),
      child: ListTile(
        dense: false,
        leading:  ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.asset("images/testImage2.jpg", width: 80, height: 100,fit: BoxFit.cover,)),
        title: Text("European Tour",style: kHeadlineTextStyle,),
        subtitle: Text('14 april - 25 april 2021'),
      ),
    );
  }
}

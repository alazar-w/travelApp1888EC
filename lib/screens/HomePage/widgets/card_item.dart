import 'package:flutter/material.dart';
import 'package:travelapp/helper/constants.dart';

class CardItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData media;
    media = MediaQuery.of(context);
    return Container(
      width: media.size.width * 0.95,
      margin: EdgeInsets.only(right: 6.0,left: 6),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child:  ListTile(
                leading:  Image.asset("images/testImage.jpg",fit: BoxFit.fitHeight,width: media.size.width* 0.95 * 0.2,height: 150,),
                title: Text("European Tour",style: kHeadlineTextStyle,),
                subtitle: Text('14 april - 25 april 2021'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

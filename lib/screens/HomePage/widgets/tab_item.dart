import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/helper/constants.dart';

class TabItem extends StatelessWidget {
  final bool active;
  final String title;
  final Function onTap;
  TabItem(this.active, this.title, {this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: ()=>onTap(),
      child: Container(
        margin: EdgeInsets.only(right: 20.0),
        child: Column(
          children: <Widget>[
            Text("$title", style: TextStyle(color: active ? kPrimaryColor:  Colors.black54, fontWeight: active ? FontWeight.w700 : FontWeight.normal,fontSize: 18.0),),
            active ? Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.only(top:6),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ): SizedBox(
              height: 14.0,
            )

          ],
        ),
      ),
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  final String rating;
  Rating(this.rating);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: <Widget>[
        _starIcon(true),
        _starIcon(true),
        _starIcon(true),
        _starIcon(true, true),
        _starIcon(),
        Text("$rating", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),)
      ],
    );
  }

  _starIcon( [active = false ,half=false]){
    return Icon(
      half ? Icons.star_half : Icons.star,
      color: active ? Colors.orangeAccent : Colors.white54,
      size: 20,
    );
  }
}
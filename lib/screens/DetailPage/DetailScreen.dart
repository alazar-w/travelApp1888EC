import 'package:flutter/material.dart';
import 'package:travelapp/helper/constants.dart';
import 'package:travelapp/screens/HomePage/HomeScreen.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: kBackgroundColor,

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _appBar(context),

              ],
            ),
          ),
        ),

      ),
    );
  }
}

_appBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      children: <Widget>[
        Expanded(
          child: FlatButton(
            child: Icon(
              Icons.arrow_back
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomeScreen()));

            },

          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25.0))),
          child: Icon(
            Icons.backup,
            color: Colors.black,
          ),
        )
      ],
    ),
  );
}

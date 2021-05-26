import 'package:flutter/material.dart';
import 'package:travelapp/helper/constants.dart';

class BottomNavigationWidget extends StatelessWidget {
  final selectedIndex;
  final onItemTapped;

  const BottomNavigationWidget(
      {Key key, this.selectedIndex, this.onItemTapped});
  @override
  Widget build(BuildContext context) {
    MediaQueryData media;
    media = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
      ),
      width: media.size.width * 0.95,
      margin: EdgeInsets.only(right: 6),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(40.0)),
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
            title: Text(""),
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("")),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: kPrimaryColor,
        onTap: onItemTapped,
      ),
    );
  }
}

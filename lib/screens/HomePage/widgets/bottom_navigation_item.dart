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
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(1,2),
            blurRadius: 2,
            spreadRadius: 4
          )
        ]
      ),
      width: media.size.width * 0.95,
      child: BottomNavigationBar(
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0x00ffffff),
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

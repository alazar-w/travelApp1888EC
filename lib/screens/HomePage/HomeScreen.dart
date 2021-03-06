import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/helper/constants.dart';
import 'package:travelapp/widgets/Widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _activeTab = 0;
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData media;
    media = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                _appBar(),
                _horizontalTabs(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text("23 sights"),
                ),
                _featuredSection(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    "Popular",
                    style: kHeadlineTextStyle,
                  ),
                ),
                _popularSection(),
              ],
            ),
          ),
        ),
        bottomNavigationBar:BottomNavigationWidget(selectedIndex: _selectedIndex,onItemTapped:_onItemTapped,),
      );
  }

  _appBar() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Text(
              "Explore",
              style: TextStyle(
              fontSize: 32.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.0),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            child: Icon(
              Icons.tune,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  _horizontalTabs() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: <Widget>[
          TabItem(
            _activeTab == 0,
            "Sights",
            onTap: () {
              setState(() {
                _activeTab = 0;
              });
            },
          ),
          TabItem(
            _activeTab == 1,
            "Tours",
            onTap: () {
              setState(() {
                _activeTab = 1;
              });
            },
          ),
          TabItem(
            _activeTab == 2,
            "Adventures",
            onTap: () {
              setState(() {
                _activeTab = 2;
              });
            },
          ),
        ],
      ),
    );
  }

  _featuredSection() {
    return Container(
      height: 300,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: FeaturedItem(),
          ),
          FeaturedItem(),
          FeaturedItem(),
        ],
      ),
    );
  }

  _popularSection() {
    return Column(
      children: <Widget>[
        CardItem(),
        CardItem(),
        CardItem(),
        CardItem(),
        CardItem(),
        CardItem(),
      ],
    );
  }
}

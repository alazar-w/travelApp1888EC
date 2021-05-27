import 'package:flutter/material.dart';
import 'package:travelapp/helper/constants.dart';
import 'package:travelapp/screens/DetailPage/widgets/booking_date.dart';

class DetailItem extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  DetailItem(this.scaffoldKey);
  @override
  _DetailItemState createState() => _DetailItemState();
}

class BookingDate {
  String title;
  int date;

  BookingDate(this.title, this.date);
}

class _DetailItemState extends State<DetailItem> {
  List<BookingDate> dates = [
    BookingDate("Su", 21),
    BookingDate("Mo", 22),
    BookingDate("Tu", 23),
    BookingDate("We", 24),
    BookingDate("Th", 25),
    BookingDate("Fr", 26),
    BookingDate("Sa", 27),
  ];

  int _activeDate = 0;

  @override
  Widget build(BuildContext context) {
    MediaQueryData media;
    media = MediaQuery.of(context);
    return Container(
      width: media.size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0))),
      padding: EdgeInsets.all(30.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Newhaven LightHouse\nin Edinburgh,United Kingdom',
              style: kHeadlineTextStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Available: "),
                      Text(
                        "10:00 -- 18:00",
                        style: kHeadlineTextStyle,
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("*"),
                      Text(
                        "Mon -- Sat",
                        style: kHeadlineTextStyle,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Duration: "),
                      Text(
                        "4 hours",
                        style: kHeadlineTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Price: "),
                      Text(
                        "\$20",
                        style: kHeadlineTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Slider(
              value: 20,
              min: 0,
              max: 100,
              divisions: 5,
              label: 20.round().toString(), onChanged: (double value) {},
//          onChanged: (double value) {
//            setState(() {
//              _currentSliderValue = value;
//            });
//          },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text("3 person"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Total:\$60",
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        context: widget.scaffoldKey.currentContext,
                        builder: (builder) => _bookingModal(context));
                    // showModalBottomSheet(context: context, builder: (context)=>Container());
                  },
                  child: Container(
                    height: 50.0,
                    padding: EdgeInsets.symmetric(horizontal: 18.0),
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(50.0),
                      gradient: _linearGradientButtonPrimary(),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Book now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _linearGradientButtonPrimary() {
    return LinearGradient(
        colors: [kPrimaryColor, kPrimaryColor.withOpacity(.79)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight);
  }

  _bookingModal(context) {
    return StatefulBuilder(
      builder: (context, setState) => Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color(0xFFF2F2F2),
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0))),
        child: Wrap(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: Colors.black,
                      )),
                  Expanded(
                    child: Text(
                      "Booking",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                  Text(
                    "Done",
                    style: TextStyle(
                        color: kPrimaryColor, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: dates
                  .map((date) => BookingDateItem(
                        isActive: _activeDate == dates.indexOf(date),
                        title: date.title,
                        date: date.date,
                        onTap: () {
                          setState(() {
                            _activeDate = dates.indexOf(date);
                          });
                        },
                      ))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Divider(),
            ),
            Column(
              children: <Widget>[
                _timeSelectorListItem(
                    "10:00-14:00", "Last spot remaining", true),
                SizedBox(
                  height: 12.0,
                ),
                _timeSelectorListItem("12:00-15:00", "Available", false),
                SizedBox(
                  height: 12.0,
                ),
                _timeSelectorListItem("14:00-18:00", "Available", false),
                SizedBox(
                  height: 80.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    _showCompletedDialog();
                  },
                  child: Container(
                    height: 50.0,
                    width: 150,
                    decoration: BoxDecoration(
                        gradient: _linearGradientButtonPrimary(),
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Center(
                        child: Text(
                      "Checkout",
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  _timeSelectorListItem(String time, String availability, active) {
    return Container(
      color: Colors.white,
      child: ListTile(
        title: Text(
          "$time",
          style: kHeadlineTextStyle,
        ),
        subtitle: Text("$availability"),
        trailing: Icon(
          active ? Icons.check_circle : Icons.check_circle_outline,
          color: active ? kPrimaryColor : Colors.black12,
        ),
      ),
    );
  }

  void _showCompletedDialog() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
        context: widget.scaffoldKey.currentContext,
        builder: (builder) => Wrap(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left:30.0, right:30, bottom:30, top:85),
                      width: kScreenWidth(context),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 80,),
                          Text("Excursion"),
                          Padding(
                            padding: const EdgeInsets.only(top:10.0),
                            child: Text("Lighthouse", style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                            child: Row(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("Time: "),
                                    Text(
                                      "24 Nov, 10:00 AM",
                                      style: kHeadlineTextStyle.copyWith(fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 10.0,),
                                Row(
                                  children: <Widget>[
                                    Text("person:"),
                                    Text(
                                      "3",
                                      style: kHeadlineTextStyle.copyWith(fontSize: 14.0),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Text("Duration: "),
                                    Text(
                                      "4 hours",
                                      style: kHeadlineTextStyle.copyWith(fontSize: 14.0),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: <Widget>[
                                    Text("Price: "),
                                    Text(
                                      "\$20",
                                      style: kHeadlineTextStyle.copyWith(fontSize: 14.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom:16.0, top: 30.0),
                            child: Text("Open Excursion", style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left:30.0, right: 30, top: 0, bottom: 30),
                        height: 50.0,
                        width: kScreenWidth(context),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50.0)
                        ),
                        child: Center(child: Text("Done", style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.bold))),
                      ),
                    )
                  ],
                ),
                Align(alignment: Alignment.topCenter, child: ClipRRect(borderRadius: BorderRadius.circular(20.0), child: Image.asset("images/testImage2.jpg", width: 150, height: 150, fit: BoxFit.cover,)))
              ],
            ),
          ],
        ));
  }
}

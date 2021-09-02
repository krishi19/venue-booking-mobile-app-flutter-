import 'package:flutter/material.dart';

class Booking_venue extends StatefulWidget {
  final List<String> details;
  const Booking_venue({Key key, @required this.details}) : super(key: key);

  @override
  _Booking_venueState createState() => _Booking_venueState();
}

// ignore: camel_case_types
class _Booking_venueState extends State<Booking_venue> {
  // ignore: non_constant_identifier_names
  var Venue_on_the_booking = [
    {
      "name": "Venue1",
      "picture": "assets/images/buddhaparty.jpg",
      "booking_price": "80,000",
      "description": "this is a banquet"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Venue_on_the_booking.length,
      itemBuilder: (context, index) {
        return Single_Booking_Venue(
            booking_venue_name: widget.details[0],
            booking_venue_booking_price: widget.details[2],
            booking_venue_picture: widget.details[3],
            booking_venue_description: widget.details[1]);
      },
    );
  }
}

class Single_Booking_Venue extends StatelessWidget {
  const Single_Booking_Venue(
      {Key key,
      this.booking_venue_name,
      this.booking_venue_picture,
      this.booking_venue_booking_price,
      this.booking_venue_description,
      this.booking_venue_discount})
      : super(key: key);
  final booking_venue_name;
  final booking_venue_picture;
  final booking_venue_booking_price;
  final booking_venue_discount;
  final booking_venue_description;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(
          booking_venue_picture,
          height: 100,
          width: 100,
          fit: BoxFit.cover,
        ),
        title: Text(booking_venue_name),
        subtitle: new Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(booking_venue_description),
                )
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              // ignore: unnecessary_brace_in_string_interps
              child: Text("\$${booking_venue_booking_price}",
                  style: TextStyle(
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFF7643),
                  )),
            )
          ],
        ),
        trailing: Column(
          children: <Widget>[
            IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: () {}),
            // IconButton(icon: Icon(Icons.arrow_drop_up), onPressed: (){}),
          ],
        ),
      ),
    );
  }
}

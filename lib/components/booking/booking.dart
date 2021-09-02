
import 'package:flutter/material.dart';
import 'package:venuebooking_app/components/booking/booking_venue.dart';
import 'package:venuebooking_app/screens/success.dart';

class Booking extends StatefulWidget {
  final List<String> details;

  const Booking({
    Key key,
    this.details,
  }) : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFFF7643),
        title: Text('My booking'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: widget.details != null
          ? Booking_venue(
              details: widget.details,
            )
          : Center(child: Text("No bookings found")),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: Text("total:"),
                subtitle: widget.details != null
                    ? Text(widget.details[2])
                    : Text("0"),
              ),
            ),
            Expanded(
              child: MaterialButton(
                onPressed: () {
                    Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SuccessScreen()));
                },
                child: Text(
                  "Check out",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}

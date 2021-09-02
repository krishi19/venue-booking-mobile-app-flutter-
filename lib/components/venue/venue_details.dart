import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../booking.dart';
import 'package:carousel_slider/carousel_slider.dart';

class VenueDetails extends StatefulWidget {
  final name;

  final price;

  final List<String> pictures;

  final discount;
  final details;
  final address;
  final venueId;

  const VenueDetails(
      {Key key,
      this.name,
      this.price,
      this.pictures,
      this.discount,
      this.address,
      this.venueId,
      this.details})
      : super(key: key);
  @override
  _VenueDetailsState createState() => _VenueDetailsState();
}

class _VenueDetailsState extends State<VenueDetails> {
  @override
  Widget build(BuildContext context) {
    // List<int> list = [1, 2, 3, 4, 5];
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFFF7643),
        title: InkWell(onTap: () {}, child: Text('VenueApp')),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          CarouselSlider(
            options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true),
            items: widget.pictures
                .map(
                  (item) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(
                      item,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Venue Details",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.details,
              textAlign: TextAlign.justify,
            ),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Name:"),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.name),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Location:"),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.address),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: new Text("Price:"),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: new Text(widget.price.toString()),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: MaterialButton(
        onPressed: () async {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          if (prefs.containsKey("key")) prefs.remove("key");
          prefs.setStringList("key",
              ["${widget.name}", "${widget.address}", "${widget.price}","${widget.pictures[0]}"]);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookingForm(
                venueId: widget.venueId,
                name: widget.name,
                address: widget.address,
                picture: widget.pictures[0],
                price: widget.price,
              ),
            ),
          );
        },
        color: Color(0xFFFF7643),
        textColor: Colors.white,
        child: Text("Book now"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:venuebooking_app/bloc/home_bloc.dart';
import 'package:venuebooking_app/components/venue/venue.dart';
import 'package:venuebooking_app/model/venue.dart';

class SearchPage extends StatefulWidget {
  final String type;
  final Position position;
  SearchPage({
    Key key,
    this.type = "Nearby",
    this.position,
  }) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchTerm;

  String fromPrice, toPrice;

  @override
  void initState() {
    super.initState();
    homeBloc.getVenueListFromSearch(
        type: widget.type == "Nearby" ? "nearby" : "latest",
        search: searchTerm,
        fromPrice: fromPrice,
        toPrice: toPrice,
        lat: widget.position?.latitude,
        lng: widget.position?.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFF7643),
        title: Container(
          height: 50,
          width: double.maxFinite,
          color: Colors.white,
          child: TextField(
            onChanged: (value) {
              searchTerm = value;
              print(searchTerm);
            },
            decoration: InputDecoration(
              hintText: "Search",
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(8),
        children: [
          Text(
            "${widget.type} venues",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Colors.black, fontWeight: FontWeight.normal),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              fromPrice = value;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Price range from:",
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            onChanged: (value) {
              toPrice = value;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: "Price range to:",
              fillColor: Colors.white,
              border: OutlineInputBorder(),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                homeBloc.getVenueListFromSearch(
                    type: widget.type == "Nearby" ? "nearby" : "latest",
                    search: searchTerm,
                    fromPrice: fromPrice,
                    toPrice: toPrice,
                    lat: widget.position.latitude,
                    lng: widget.position.longitude);
              },
              child: Text("Search")),
          Divider(
            height: 10,
            thickness: 5,
          ),
          widget.type == "Nearby"
              ? SizedBox(
                  height: MediaQuery.of(context).size.height / 2.3,
                  child: StreamBuilder<List<Venue>>(
                    stream: homeBloc.venueListFromSearch.stream,
                    builder: (context, AsyncSnapshot<List<Venue>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var venue = snapshot.data[index];
                            return VenueCard(
                              name: venue.name,
                              pictures: venue.imageUrls,
                              price: venue.cost,
                              capacity: venue.capacity,
                              category: venue.category,
                              details: venue.description,
                              address: venue.address,
                              distance:venue.distance
                            );
                          },
                        );
                      }
                      return Center(
                        child: Text("Loading"),
                      );
                    },
                  ),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height / 2.3,
                  child: StreamBuilder<List<Venue>>(
                    stream: homeBloc.venueListFromSearch.stream,
                    builder: (context, AsyncSnapshot<List<Venue>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            var venue = snapshot.data[index];
                            return VenueCard(
                              name: venue.name,
                              pictures: venue.imageUrls,
                              price: venue.cost,
                              capacity: venue.capacity,
                              category: venue.category,
                              details: venue.description,
                              address: venue.address,
                            );
                          },
                        );
                      }
                      return Center(
                        child: Text("Loading"),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

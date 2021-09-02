import 'package:flutter/material.dart';
import 'package:venuebooking_app/bloc/home_bloc.dart';
import 'package:venuebooking_app/components/about_us.dart';
import 'package:venuebooking_app/components/booking/booking.dart';
import 'package:venuebooking_app/components/search/search_field.dart';
import 'package:venuebooking_app/components/venue/venue.dart';
import 'package:venuebooking_app/components/venue/venue_category.dart';
import 'package:venuebooking_app/model/category.dart';
import 'package:venuebooking_app/model/venue.dart';
import 'package:venuebooking_app/pages/login.dart';
import 'package:geolocator/geolocator.dart';


import '../../constants.dart';
import '../../cutsomshapeclipper.dart';
import '../search_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position _currentPosition;

  @override
  void initState() {
    _getCurrentLocation();
    homeBloc.getLatestVenueList("latest");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFFFF7643),
        title: Text('VenueApp'),
        actions: <Widget>[
          new IconButton(
            icon: Icon(
              Icons.shopping_basket,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Booking()));
            },
          )
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Booking()));
              },
              child: ListTile(
                title: Text('My booking'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
          
            Divider(),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AboutScreen()));
              },
              child: ListTile(
                title: Text('about us'),
                leading: Icon(
                  Icons.announcement_outlined,
                  color: kPrimaryColor,
                ),
              ),
            ),
           
              
          
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            // HomeHeader(),
            // HomeBottomPart(),
            Stack(
              overflow: Overflow.visible,
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [kPrimaryColor, kSecondaryColor],
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Where do you want to book your venue?",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchPage(
                          position: _currentPosition,
                        ),
                      ),
                    ),
                    child: SearchField(),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 175,
              child: StreamBuilder<List<Category>>(
                stream: homeBloc.categoryList.stream,
                builder: (context, AsyncSnapshot<List<Category>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var category = snapshot.data[index];
                          return VenueCategory(
                            category: category.name,
                            imageUrl: category.imageUrl,
                          );
                        });
                  }
                  return Center(child: Text("Loading"));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Nearby venues",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(
                            position: _currentPosition,
                          ),
                        )),
                    child: Text(
                      "Show all",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 235,
              child: StreamBuilder<List<Venue>>(
                stream: homeBloc.venueList.stream,
                builder: (context, AsyncSnapshot<List<Venue>> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: snapshot.data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var venue = snapshot.data[index];
                          return VenueCard(
                            venueId: venue.id,
                            name: venue.name,
                            pictures: venue.imageUrls,
                            price: venue.cost,
                            capacity: venue.capacity,
                            category: venue.category,
                            details: venue.description,
                            address: venue.address,
                            distance: venue.distance,
                          );
                        });
                  }
                  return Center(
                    child: Text("Loading"),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Venues",
                    style: Theme.of(context).textTheme.headline5.copyWith(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SearchPage(
                            position: _currentPosition,
                            type: "Latest",
                          ),
                        )),
                    child: Text(
                      "Show all",
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 220,
              child: StreamBuilder<List<Venue>>(
                  stream: homeBloc.latestVenueList.stream,
                  builder: (context, AsyncSnapshot<List<Venue>> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: snapshot.data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            var venue = snapshot.data[index];
                            return VenueCard(
                              venueId: venue.id,
                              name: venue.name,
                              pictures: venue.imageUrls,
                              price: venue.cost,
                              capacity: venue.capacity,
                              category: venue.category,
                              details: venue.description,
                              address: venue.address,
                            );
                          });
                    }

                    return Center(child: Text("Loading"));
                  }),
            )
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.bestForNavigation)
        .then((Position position) {
      _currentPosition = position;

      homeBloc.getVenueList(
          lat: _currentPosition.latitude,
          lng: _currentPosition.longitude,
          type: "nearby");
      print(
          " latitude: ${_currentPosition.latitude} longitude: ${_currentPosition.longitude}");
    }).catchError((e) {
      print(e);
    });
  }
}

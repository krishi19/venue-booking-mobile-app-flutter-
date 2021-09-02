import 'package:flutter/material.dart';
import 'package:venuebooking_app/components/venue/venue_details.dart';

class VenueCard extends StatelessWidget {
  final name;
  final pictures;
  final price;
  final discount;
  final capacity;
  final category;
  final details;
  final address;
  final venueId;
  final distance;

  const VenueCard(
      {Key key,
      this.name,
      this.venueId,
      this.pictures,
      this.price,
      this.discount = 0,
      this.category,
      this.details,
      this.address,
      this.distance,
      this.capacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey.shade200,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => VenueDetails(
                venueId: venueId,
                name: name,
                pictures: pictures,
                price: price,
                discount: discount,
                details: details,
                address: address,
              ),
            ),
          );
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                pictures[0],
                fit: BoxFit.fitWidth,
                height: 85,
                width: 250,
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Name:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(name),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Cost:"),
                      SizedBox(width: 10),
                      Text(
                        price.toString(),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Capacity:"),
                      SizedBox(width: 10),
                      Text(
                        capacity,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Category:"),
                      SizedBox(width: 10),
                      Text(
                        category,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Address:"),
                      SizedBox(width: 10),
                      Text(
                        address,
                      ),
                    ],
                  ),
                  distance != null
                      ? Row(
                          children: [
                            Text("Distance:"),
                            SizedBox(width: 10),
                            Text(
                              distance.toString()+' Metre Away',
                            ),
                          ],
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import '../venue.dart';

class VenueListResponse {
  List<Venue> venues;
  String error;

  VenueListResponse({this.venues, this.error});

  VenueListResponse.fromJson(Map<String, dynamic> json)
      : venues = List<Venue>.from(json["data"].map((x) => Venue.fromJson(x))),
        error = null;

  VenueListResponse.withError(String errorValue)
      : venues = [],
        error = errorValue;
}

import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';
import 'package:venuebooking_app/model/category.dart';
import 'package:venuebooking_app/model/response/category_list_response.dart';
import 'package:venuebooking_app/model/response/venue_list_response.dart';
import 'package:venuebooking_app/model/venue.dart';
import 'package:venuebooking_app/repository/home_repository.dart';

class HomeBloc {
  final _repository = HomeRepository();

  final _categoryList = BehaviorSubject<List<Category>>();
  final _venueList = BehaviorSubject<List<Venue>>();
  final _latestVenueList = BehaviorSubject<List<Venue>>();
  final _venueListFromSearch = BehaviorSubject<List<Venue>>();

  getCategoryList() async {
    CategoryListResponse categoryListResponse =
        await _repository.getCategoryList();
    _categoryList.sink.add(categoryListResponse.categories);
    return categoryListResponse;
  }

  getVenueList({lat, lng, type}) async {
    VenueListResponse venueListResponse =
        await _repository.getVenueList(lat: lat, lng: lng, type: type);
    _venueList.sink.add(venueListResponse.venues);
    return venueListResponse;
  }

  getVenueListFromSearch({lat, lng, type, fromPrice, toPrice, search}) async {
    VenueListResponse venueListResponse =
        await _repository.getVenueListFromSearch(
            lat: lat,
            lng: lng,
            type: type,
            fromPrice: fromPrice,
            search: search,
            toPrice: toPrice);
    _venueListFromSearch.sink.add(venueListResponse.venues);
    return venueListResponse;
  }

  getLatestVenueList(type) async {
    VenueListResponse venueListResponse =
        await _repository.getVenueList(type: type);
    _latestVenueList.sink.add(venueListResponse.venues);
    return venueListResponse;
  }

  postBooking({
    fullName,
    location,
    contact,
    date,
    email,
    peopleNumber,
    venueId,
  }) async {
    Response response = await _repository.postBooking(
      fullName: fullName,
      location: location,
      contact: contact,
      date: date,
      email: email,
      peopleNumber: peopleNumber,
      venueId: venueId,
    );
    return response;
  }

  void dispose() async {
    await _categoryList.drain();
    await _venueList.drain();
    await _latestVenueList.drain();
    await _venueListFromSearch.drain();
    _categoryList.close();
    _venueList.close();
    _latestVenueList.close();
    _venueListFromSearch.close();
  }

  BehaviorSubject<List<Category>> get categoryList => _categoryList;
  BehaviorSubject<List<Venue>> get venueList => _venueList;
  BehaviorSubject<List<Venue>> get venueListFromSearch => _venueListFromSearch;
  BehaviorSubject<List<Venue>> get latestVenueList => _latestVenueList;
}

final homeBloc = HomeBloc();

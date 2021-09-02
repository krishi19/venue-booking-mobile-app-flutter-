import 'package:dio/dio.dart';
import 'package:venuebooking_app/model/response/category_list_response.dart';
import 'package:venuebooking_app/model/response/venue_list_response.dart';

import 'base_repository.dart';

class HomeRepository {
  String appUrl;
  Dio _dio;

  HomeRepository() {
    _dio = baseRepository.dio;
    appUrl = baseRepository.appUrl;
  }

  Future<CategoryListResponse> getCategoryList() async {
    try {
      Response response = await _dio.get('$appUrl/categories');
      return CategoryListResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return CategoryListResponse.withError(baseRepository.handleError(error));
    }
  }

  Future<VenueListResponse> getVenueList({lat, lng, type}) async {
    try {
      Response response = await _dio.get('$appUrl/venues',
          queryParameters: {"type": type, "user_lat": lat, "user_lng": lng});
      return VenueListResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return VenueListResponse.withError(baseRepository.handleError(error));
    }
  }

  Future<Response> postBooking({
    fullName,
    email,
    contact,
    date,
    location,
    peopleNumber,
    venueId,
  }) async {
    Response response;
    try {
      response = await _dio.post('$appUrl/bookings', queryParameters: {
        "full_name": fullName,
        "email": email,
        "contact": contact,
        "date": date,
        "location": location,
        "no_of_people": peopleNumber,
        "venue_id": venueId,
      });
      print('response');
      return response;
    } catch (error, stacktrace) {
      print('errorrrr');
      print("Exception occurred: $error stackTrace: $stacktrace");
      return response;
    }
  }

  Future<VenueListResponse> getVenueListFromSearch({
    lat,
    lng,
    type,
    search,
    toPrice,
    fromPrice,
  }) async {
    try {
      Response response = await _dio.get(
        '$appUrl/venues',
        queryParameters: {
          "type": type,
          "user_lat": lat,
          "user_lng": lng,
          "search": search,
          "from_price": fromPrice,
          "to_price": toPrice,
        },
      );
      return VenueListResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occurred: $error stackTrace: $stacktrace");
      return VenueListResponse.withError(baseRepository.handleError(error));
    }
  }
}

final homeRepository = HomeRepository();

import '../category.dart';

class CategoryListResponse {
  List<Category> categories;
  String error;

  CategoryListResponse({this.categories, this.error});

  CategoryListResponse.fromJson(Map<String, dynamic> json)
      : categories =
            List<Category>.from(json["data"].map((x) => Category.fromJson(x))),
        error = null;

  CategoryListResponse.withError(String errorValue)
      : categories = [],
        error = errorValue;
}

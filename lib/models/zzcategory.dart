// models/category.dart
import 'package:tipon_timekeeping_app/models/zzproduct.dart';

class Category {
  int id;
  String name;
  List<Product> products;

  Category({required this.id, required this.name, required this.products});
}
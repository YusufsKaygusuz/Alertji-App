import 'package:alertji_app/product/model/sub_category_model.dart';

import 'package:alertji_app/product/model/category_model.dart';
//import 'package:alertji_app/view/home/homepage/view/homepage_view.dart';
//import 'package:flutter/material.dart';

class HomePageViewModel {
  static List<Category> categoryList = [
    Category(
      categoryId: 1,
      name: 'Vegetable',
      thumbnail: 'assets/images/fruits.jpg',
    ),
    Category(
      categoryId: 2,
      name: 'Fruit',
      thumbnail: 'assets/images/fruits.jpg',
    ),
    Category(
      categoryId: 3,
      name: 'Dairy Products',
      thumbnail: 'assets/images/milks.jpg',
    ),
    Category(
      categoryId: 4,
      name: 'Spice',
      thumbnail: 'assets/images/spice.jpg',
    ),
    Category(
      categoryId: 5,
      name: 'Meat and Chicken',
      thumbnail: 'assets/images/meatandchicken.jpg',
    ),
    Category(
      categoryId: 6,
      name: 'Bread and Patisserie',
      thumbnail: 'assets/images/bread.jpg',
    ),
    Category(
      categoryId: 7,
      name: 'Seafood',
      thumbnail: 'assets/images/seafood.jpg',
    ),
    Category(
      categoryId: 8,
      name: 'Legumes',
      thumbnail: 'assets/images/legumes.jpg',
    ),
  ];
  static List<SubCategory> allSelectedSubCategories = [];
}

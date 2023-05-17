import 'package:alertji_app/view/home/homepage/view/homepage_view.dart';
import 'package:flutter/material.dart';
import 'package:alertji_app/product/model/category_model.dart';

abstract class HomePageViewModel extends State<HomePageView> {
  List<Category> categoryList = [
    Category(
      categoryId: 1,
      name: 'Food',
      thumbnail: 'assets/images/foods.jpg',
    ),
    Category(
      categoryId: 2,
      name: 'Vegetable and Fruit',
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
  ];
}

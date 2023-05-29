import 'package:alertji_app/product/model/sub_category_model.dart';
import 'package:alertji_app/view/home/homepage/view/sub_category_view.dart';
import 'package:alertji_app/view/home/homepage/viewmodel/homepage_viewmodel.dart';
import 'package:flutter/material.dart';

abstract class SubCategoryViewModel extends State<SubCategoryView> {
  static List<SubCategory> subCategories = [
    SubCategory(categoryId: 1, name: "Hamburger", isSelected: false),
    SubCategory(categoryId: 1, name: "Pizza", isSelected: false),
    SubCategory(categoryId: 1, name: "Whatever", isSelected: false),
    SubCategory(categoryId: 2, name: "Apple", isSelected: false),
    SubCategory(categoryId: 2, name: "Banana", isSelected: false),
    SubCategory(categoryId: 2, name: "Tomato", isSelected: false),
    SubCategory(categoryId: 3, name: "Goat Milk", isSelected: false),
    SubCategory(categoryId: 3, name: "Hellim Cheese", isSelected: false),
    SubCategory(categoryId: 3, name: "Lactose", isSelected: false),
    SubCategory(categoryId: 4, name: "Soya Souce", isSelected: false),
    SubCategory(categoryId: 4, name: "Mint", isSelected: false),
    SubCategory(categoryId: 4, name: "Cinnamon", isSelected: false),
  ];

  bool isSubCategorySelected(SubCategory subCategory) {
    return HomePageViewModel.allSelectedSubCategories.any(
        (selectedSubCategory) => selectedSubCategory.name == subCategory.name);
  }

  List<SubCategory> selectedSubCategory = [];
}

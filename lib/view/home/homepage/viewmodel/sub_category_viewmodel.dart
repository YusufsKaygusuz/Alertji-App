import 'package:alertji_app/product/model/sub_category_model.dart';
import 'package:alertji_app/view/home/homepage/view/sub_category_view.dart';
import 'package:alertji_app/view/home/homepage/viewmodel/homepage_viewmodel.dart';
import 'package:flutter/material.dart';

abstract class SubCategoryViewModel extends State<SubCategoryView> {
  static List<SubCategory> subCategories = [
    SubCategory(categoryId: 1, name: "Lettuce", isSelected: false),
    SubCategory(categoryId: 1, name: "Garlic", isSelected: false),
    SubCategory(categoryId: 1, name: "Onion", isSelected: false),
    SubCategory(categoryId: 1, name: "Cabbage", isSelected: false),
    SubCategory(categoryId: 1, name: "Cauliflower", isSelected: false),
    SubCategory(categoryId: 1, name: "Broccoli", isSelected: false),
    SubCategory(categoryId: 1, name: "Beans", isSelected: false),
    SubCategory(categoryId: 1, name: "Artichoke", isSelected: false),
    SubCategory(categoryId: 1, name: "Leek", isSelected: false),
    SubCategory(categoryId: 1, name: "Okra", isSelected: false),
    SubCategory(categoryId: 1, name: "Mushroom", isSelected: false),
    SubCategory(categoryId: 1, name: "Eggplant", isSelected: false),
    SubCategory(categoryId: 1, name: "Corn", isSelected: false),
    SubCategory(categoryId: 2, name: "Apple", isSelected: false),
    SubCategory(categoryId: 2, name: "Banana", isSelected: false),
    SubCategory(categoryId: 2, name: "Tomato", isSelected: false),
    SubCategory(categoryId: 2, name: "Melon", isSelected: false),
    SubCategory(categoryId: 2, name: "Watermelon", isSelected: false),
    SubCategory(categoryId: 2, name: "Grape", isSelected: false),
    SubCategory(categoryId: 2, name: "Peach", isSelected: false),
    SubCategory(categoryId: 2, name: "Cherry", isSelected: false),
    SubCategory(categoryId: 2, name: "Lemon", isSelected: false),
    SubCategory(categoryId: 3, name: "Goat Milk", isSelected: false),
    SubCategory(categoryId: 3, name: "Cream", isSelected: false),
    SubCategory(categoryId: 3, name: "Hellim Cheese", isSelected: false),
    SubCategory(categoryId: 3, name: "Lactose", isSelected: false),
    SubCategory(categoryId: 3, name: "Egg", isSelected: false),
    SubCategory(categoryId: 3, name: "Butter", isSelected: false),
    SubCategory(categoryId: 3, name: "Yogurt", isSelected: false),
    SubCategory(categoryId: 3, name: "Whey", isSelected: false),
    SubCategory(categoryId: 4, name: "Soya Souce", isSelected: false),
    SubCategory(categoryId: 4, name: "Mint", isSelected: false),
    SubCategory(categoryId: 4, name: "Crab", isSelected: false),
    SubCategory(categoryId: 7, name: "Salmon", isSelected: false),
    SubCategory(categoryId: 7, name: "Lobster", isSelected: false),
    SubCategory(categoryId: 7, name: "Tuna", isSelected: false),
    SubCategory(categoryId: 7, name: "Shrimp", isSelected: false),
    SubCategory(categoryId: 7, name: "Mussels", isSelected: false),
  ];

  bool isSubCategorySelected(SubCategory subCategory) {
    return HomePageViewModel.allSelectedSubCategories.any(
        (selectedSubCategory) => selectedSubCategory.name == subCategory.name);
  }

  List<SubCategory> selectedSubCategory = [];
}

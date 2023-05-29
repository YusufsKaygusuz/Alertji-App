import 'package:alertji_app/product/model/category_model.dart';
import 'package:alertji_app/product/model/sub_category_model.dart';
import 'package:flutter/material.dart';
import '../../homepage/viewmodel/homepage_viewmodel.dart';

class AllergensViewModel with ChangeNotifier {
  final List<Category> categoryList = HomePageViewModel.categoryList;
  final List<Category> expandedCategories = [];
  List<SubCategory> subCategories = HomePageViewModel.allSelectedSubCategories;

  void toggleCategoryExpansion(Category category, bool isExpanded) {
    if (isExpanded) {
      expandedCategories.add(category);
    } else {
      expandedCategories.remove(category);
    }
    notifyListeners();
  }

  void toggleSubCategorySelection(SubCategory subCategory, bool value) {
    subCategory.isSelected = value;
    notifyListeners();
  }

  void removeSelectedSubCategories() {
    subCategories.removeWhere((subCategory) => !subCategory.isSelected);
    notifyListeners();
  }
}

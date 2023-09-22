import 'package:alertji_app/product/model/category_model.dart';
import 'package:alertji_app/product/model/sub_category_model.dart';

class CategoriesRepository {
  List<Category> getCategories() {
    return [
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
      Category(
        categoryId: 5,
        name: 'Meat and Chicken',
        thumbnail: 'assets/images/spice.jpg',
      ),
      Category(
        categoryId: 6,
        name: 'Bread and Patisserie',
        thumbnail: 'assets/images/spice.jpg',
      ),
      Category(
        categoryId: 7,
        name: 'Seafood',
        thumbnail: 'assets/images/spice.jpg',
      ),
      Category(
        categoryId: 8,
        name: 'Legumes',
        thumbnail: 'assets/images/spice.jpg',
      ),
    ];
  }

  static List<SubCategory> allSelectedSubCategories = [];

  List<SubCategory> getSubCategories() {
    return [
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
  }

  bool isSubCategorySelected(SubCategory subCategory) {
    return allSelectedSubCategories.any(
        (selectedSubCategory) => selectedSubCategory.name == subCategory.name);
  }

  List<SubCategory> selectedSubCategory = [];
}

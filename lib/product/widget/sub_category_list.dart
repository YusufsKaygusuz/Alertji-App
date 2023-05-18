import 'package:flutter/material.dart';
import 'package:alertji_app/product/model/sub_category_model.dart';

class SubCategoryList extends StatelessWidget {
  final int selectedCategory;
  final String name;
  final bool isSelected;
  final int index;
  final Function(SubCategory) onTap;

  const SubCategoryList({
    required this.selectedCategory,
    required this.name,
    required this.isSelected,
    required this.index,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Colors.green[700],
            )
          : const Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
      onTap: () => onTap(SubCategory(
        name: name,
        isSelected: isSelected,
        categoryId: selectedCategory,
      )),
    );
  }
}

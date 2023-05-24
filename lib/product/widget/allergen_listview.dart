import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:alertji_app/view/home/allergenspage/viewmodel/allergens_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllergensListView extends StatefulWidget {
  const AllergensListView({Key? key}) : super(key: key);

  @override
  State<AllergensListView> createState() => _AllergensListViewState();
}

class _AllergensListViewState extends State<AllergensListView> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AllergensViewModel>(context);
    final subCategories = viewModel.subCategories;
    final expandedCategories = viewModel.expandedCategories;

    final filteredCategories = viewModel.categoryList.where((category) {
      return subCategories
          .any((subCategory) => subCategory.categoryId == category.categoryId);
    }).toList();

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: filteredCategories.length,
      itemBuilder: (context, index) {
        final category = filteredCategories[index];
        final subCategoriesForCategory = subCategories
            .where(
                (subCategory) => subCategory.categoryId == category.categoryId)
            .toList();

        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4.0,
                spreadRadius: 0.05,
              ),
            ],
          ),
          child: ExpansionTile(
            title: Text(
              category.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            textColor: ColorConst.primaryDarkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(color: Colors.transparent),
            ),
            onExpansionChanged: (isExpanded) {
              viewModel.toggleCategoryExpansion(category, isExpanded);
            },
            initiallyExpanded: expandedCategories.contains(category),
            children: subCategoriesForCategory
                .map((subCategory) => ListTile(
                      trailing: subCategory.isSelected
                          ? const Icon(
                              Icons.check_circle_outline,
                              color: Colors.grey,
                            )
                          : Icon(
                              Icons.check_circle,
                              color: Colors.green[700],
                            ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          subCategory.name,
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      onTap: () {
                        Provider.of<AllergensViewModel>(context, listen: false)
                            .toggleSubCategorySelection(
                                subCategory, !subCategory.isSelected);
                        setState(() {});
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }
}

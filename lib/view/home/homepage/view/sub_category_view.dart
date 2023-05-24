import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:alertji_app/product/widget/primary_button.dart';
import 'package:alertji_app/view/home/homepage/viewmodel/homepage_viewmodel.dart';
import 'package:alertji_app/view/home/homepage/viewmodel/sub_category_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:alertji_app/product/model/category_model.dart';
import 'package:alertji_app/product/widget/custom_appbar.dart';
import 'package:alertji_app/product/widget/search_textfield.dart';
import 'package:alertji_app/product/model/sub_category_model.dart';

class SubCategoryView extends StatefulWidget {
  final Category selectedCategory;

  const SubCategoryView({required this.selectedCategory, Key? key})
      : super(key: key);

  @override
  State<SubCategoryView> createState() => _SubCategoryViewState();
}

class _SubCategoryViewState extends SubCategoryViewModel {
  late List<SubCategory> filteredSubCategories;
  String searchText = '';
  List<SubCategory> selectedSubCategories = [];
  @override
  void initState() {
    super.initState();

    filteredSubCategories = SubCategoryViewModel.subCategories
        .where((subCategory) =>
            subCategory.categoryId == widget.selectedCategory.categoryId)
        .toList();

    // Clear the selected subcategories list
    selectedSubCategories.clear();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(
          context,
        );
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                icon: Icons.close,
                text:
                    "Choose ${widget.selectedCategory.name}\nyou are allergic to..",
                onPressed: () {
                  Navigator.pop(
                      context, HomePageViewModel.allSelectedSubCategories);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SearchTextField(
                  onChanged: (value) {
                    setState(() {
                      searchText = value;
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: filteredSubCategories.length,
                  itemBuilder: (context, index) {
                    final subCategory = filteredSubCategories[index];
                    if (searchText.isNotEmpty &&
                        !subCategory.name
                            .toLowerCase()
                            .contains(searchText.toLowerCase())) {
                      return Container();
                    }
                    return ListTile(
                      title: Text(
                        subCategory.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: subCategory.isSelected
                          ? const Icon(
                              Icons.check_circle,
                              color: ColorConst.primaryDarkColor,
                            )
                          : const Icon(
                              Icons.check_circle_outline,
                              color: ColorConst.hintTextcolor,
                            ),
                      onTap: () {
                        setState(() {
                          subCategory.isSelected = !subCategory.isSelected;
                          if (subCategory.isSelected) {
                            selectedSubCategories.add(subCategory);
                          } else {
                            selectedSubCategories.remove(subCategory);
                          }
                        });
                      },
                    );
                  },
                ),
              ),
              if (selectedSubCategories.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: PrimaryButton(
                    onPressed: () {
                      // Add button pressed
                      for (var subCategory in selectedSubCategories) {
                        if (!isSubCategorySelected(subCategory)) {
                          HomePageViewModel.allSelectedSubCategories
                              .add(subCategory);
                        }
                      }
                      selectedSubCategories.clear();
                      setState(() {});
                    },
                    buttonText: "Add (${selectedSubCategories.length})",
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

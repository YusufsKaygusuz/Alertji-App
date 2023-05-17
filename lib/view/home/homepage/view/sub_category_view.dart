import 'package:alertji_app/product/model/category_model.dart';
import 'package:alertji_app/product/widget/custom_appbar.dart';
import 'package:alertji_app/product/widget/search_textfield.dart';
import 'package:alertji_app/product/model/sub_category_model.dart';
import 'package:alertji_app/view/home/homepage/viewmodel/sub_category_viewmodel.dart';
import 'package:flutter/material.dart';

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

  @override
  void initState() {
    super.initState();
    filteredSubCategories = subCategories
        .where((subCategory) =>
            subCategory.categoryId == widget.selectedCategory.categoryId)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
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
                  Navigator.pop(context);
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
                    return subCategoryList(
                      subCategory.categoryId,
                      subCategory.name,
                      subCategory.isSelected,
                      index,
                    );
                  },
                ),
              ),
              if (selectedSubCategory.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 10,
                  ),
                  child: SizedBox(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 71, 229, 166),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 4,
                      ),
                      child: Text(
                        "Add (${selectedSubCategory.length})",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget subCategoryList(
      int selectedCategory, String name, bool isSelected, int index) {
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
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedSubCategory.removeWhere(
                (element) => element.name == subCategories[index].name);
          } else {
            selectedSubCategory.add(
              SubCategory(
                  name: name, isSelected: true, categoryId: selectedCategory),
            );
          }
          subCategories[index].isSelected = !isSelected;
        });
      },
    );
  }
}

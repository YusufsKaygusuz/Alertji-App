import 'package:alertji_app/product/model/category_model.dart';
import 'package:alertji_app/product/widget/category_card.dart';
import 'package:alertji_app/product/widget/custom_appbar.dart';
import 'package:alertji_app/view/home/homepage/viewmodel/homepage_viewmodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends HomePageViewModel {
  late Category selectedCategory;
  String userName = FirebaseAuth.instance.currentUser!.displayName ?? 'name';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            icon: Icons.notifications,
            onPressed: () {},
            text: 'Welcome, ' + userName,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore Categories",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
          GridView.builder(
              shrinkWrap: true,
              itemCount: categoryList.length,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: .95,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemBuilder: (context, index) {
                return CategoryCard(
                  category: categoryList[index],
                );
              })
        ],
      ),
    );
  }
}

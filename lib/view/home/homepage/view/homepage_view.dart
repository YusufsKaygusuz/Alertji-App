import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:alertji_app/product/widget/category_card.dart';
import 'package:alertji_app/product/widget/custom_appbar.dart';
import 'package:alertji_app/view/home/homepage/bloc/homepage_cubit.dart';
import 'package:alertji_app/view/home/homepage/bloc/homepage_state.dart';
import 'package:alertji_app/view/home/homepage/categories_repository.dart';
import 'package:alertji_app/view/home/homepage/view/qrpage_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final CategoriesRepository repo = CategoriesRepository();
    return BlocProvider(
      create: (context) => HomePageCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorConst.primaryColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => QRScannerPage()),
            );
          },
          child: const Icon(Icons
              .qr_code_scanner_rounded), // FAB içeriği, genellikle bir ikon olur
        ),
        body: BlocConsumer<HomePageCubit, HomePageState>(
          listener: ((context, state) {}),
          builder: (context, state) {
            if (state is HomePageInitial) {
              context.read<HomePageCubit>().initializeData(
                    user!.displayName!,
                    repo.getCategories(),
                  );
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is HomePageLoaded) {
              return Column(
                children: [
                  CustomAppBar(
                    icon: Icons.notifications,
                    onPressed: () {},
                    text: 'Welcome, ${state.userName}',
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Explore Categories",
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.categoryList.length,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 8),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.1,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ),
                      itemBuilder: (context, index) {
                        return CategoryCard(
                          category: state.categoryList[index],
                        );
                      },
                    ),
                  ),
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

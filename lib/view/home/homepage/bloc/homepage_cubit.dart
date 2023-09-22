import 'package:alertji_app/product/model/category_model.dart';
import 'package:alertji_app/view/home/homepage/bloc/homepage_state.dart';
import 'package:alertji_app/view/home/homepage/categories_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(const HomePageInitial([], ''));

  Future<void> initializeData(
      String userName, List<Category> categoryList) async {
    return Future.delayed(const Duration(seconds: 1), () {
      loadHomePage();
      emit(HomePageLoaded(categoryList, userName));
    });
  }

  void loadHomePage() async {
    final user = FirebaseAuth.instance.currentUser;
    final userName = user?.displayName;
    final categories = CategoriesRepository().getCategories();
    emit(HomePageLoaded(categories, userName!));
  }
}

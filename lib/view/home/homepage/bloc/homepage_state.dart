import 'package:alertji_app/product/model/category_model.dart';
import 'package:equatable/equatable.dart';

abstract class HomePageState extends Equatable {
  final String userName;
  final List<Category> categoryList;

  const HomePageState(this.categoryList, this.userName);

  @override
  List<Object> get props => [userName, categoryList];
}

class HomePageInitial extends HomePageState {
  const HomePageInitial(super.categoryList, super.userName);
}

class HomePageLoaded extends HomePageState {
  const HomePageLoaded(super.categoryList, super.userName);

  @override
  List<Object> get props => [userName, categoryList];
}

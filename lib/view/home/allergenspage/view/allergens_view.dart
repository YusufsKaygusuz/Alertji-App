import 'package:alertji_app/product/widget/allergen_listview.dart';
import 'package:alertji_app/product/widget/custom_appbar.dart';
import 'package:alertji_app/product/widget/primary_button.dart';
import 'package:alertji_app/view/home/allergenspage/viewmodel/allergens_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllergensView extends StatefulWidget {
  const AllergensView({Key? key}) : super(key: key);

  @override
  State<AllergensView> createState() => _AllergensViewState();
}

class _AllergensViewState extends State<AllergensView> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AllergensViewModel>(
      create: (context) => AllergensViewModel(),
      child: Scaffold(
        body: Column(
          children: [
            CustomAppBar(
                icon: Icons.check, text: "Allergens", onPressed: () {}),
            const Expanded(child: AllergensListView()),
            PrimaryButton(
              onPressed: () async {
                AllergensViewModel().removeSelectedSubCategories();
                setState(() {});
              },
              buttonText: 'Remove Selected',
            )
          ],
        ),
      ),
    );
  }
}

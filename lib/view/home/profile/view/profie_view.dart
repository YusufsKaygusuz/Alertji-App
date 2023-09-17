import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:alertji_app/product/widget/draw_clip.dart';
import 'package:alertji_app/view/home/profile/bloc/profile_cubit.dart';
import 'package:alertji_app/view/home/profile/bloc/profile_state.dart';
import 'package:alertji_app/view/home/profile/viewmodel/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../navigationpage/view/navigation_view.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 152, 236, 143),
                    Color.fromARGB(255, 71, 229, 166),
                    Color.fromARGB(255, 65, 200, 146),
                  ],
                  stops: [0.0, 0.5, 1.0],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => NavigationView()),
                    (Route<dynamic> route) => false);
              },
            ),
            title: const Text("Hesabım"),
            backgroundColor: Colors.green,
          ),
          body: BlocConsumer<ProfileCubit, ProfileState>(
            listener: ((context, state) {}),
            builder: (context, state) {
              if (state is ProfileInitialState) {
                context.watch<ProfileCubit>().runPage();
                return const Center(
                    child: CircularProgressIndicator(
                        color: ColorConst.primaryColor));
              } else if (state is ProfileLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(
                        color: ColorConst.primaryColor));
              } else if (state is ProfileCompletedState) {
                return const SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(height: 580, child: CustomGradientClip()),
                          Body(),
                        ],
                      ),
                    ],
                  ),
                );
              } else {
                return const Center(child: Text("Yükleme Başarısız"));
              }
            },
          )),
    );
  }
}

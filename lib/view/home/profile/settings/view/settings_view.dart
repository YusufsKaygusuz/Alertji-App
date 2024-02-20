import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:alertji_app/view/home/profile/settings/bloc/settings_cubit.dart';
import 'package:alertji_app/view/home/profile/settings/bloc/settings_state.dart';
import 'package:alertji_app/view/home/profile/view/profie_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../product/widget/draw_clip.dart';

class SettingsPage extends StatelessWidget {
  bool isDarkModeEnabled = false;
  String selectedLanguage = 'English';

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: Scaffold(
          body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SettingsInitialState) {
            return Scaffold(
              appBar: AppBar(
                title: const Text("Settings"),
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
                        MaterialPageRoute(
                            builder: (context) => const ProfileView()),
                        (Route<dynamic> route) => false);
                  },
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      const CustomGradientClip(),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            const Text(
                              'Appearance Settings',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 8.0),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              padding: const EdgeInsets.all(12.0),
                              child: ListTile(
                                title: Text(
                                  isDarkModeEnabled ? 'Light Mod' : 'Dark Mod',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                trailing: Transform.scale(
                                  scale: 1.5,
                                  child: Switch(
                                    value: isDarkModeEnabled,
                                    onChanged: (bool? value) {},
                                    activeColor: Colors.white,
                                    activeTrackColor:
                                        Colors.white.withOpacity(0.3),
                                  ),
                                ),
                                contentPadding: EdgeInsets.zero,
                                dense: true,
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            const Text(
                              'Language Settings',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            const SizedBox(height: 8.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(color: Colors.white),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: DropdownButtonFormField<String>(
                                value: selectedLanguage,
                                onChanged: (String? newValue) {},
                                items: <String>[
                                  'Turkish',
                                  'English'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                decoration: const InputDecoration(
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else if (state is SettingsLoadingState) {
            return const Center(
                child:
                    CircularProgressIndicator(color: ColorConst.primaryColor));
          } else {
            return const Center(
              child: Text("Bloc Error"),
            );
          }
        },
      )),
    );
  }
}

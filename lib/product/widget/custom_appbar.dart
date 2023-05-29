import 'package:alertji_app/core/constants/color_constant.dart';
import 'package:alertji_app/core/constants/screen_size.dart';
import 'package:alertji_app/product/widget/cricle_button.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function() onPressed;

  const CustomAppBar({
    required this.icon,
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenSize.init(context);
    return Container(
      height: ScreenSize.screenWidth / 3.5,
      width: double.infinity,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.1, 0.5],
          colors: [
            ColorConst.appbarColor,
            ColorConst.primaryColor,
          ],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: ColorConst.backgroundColor),
                ),
                CircleButton(
                  icon: icon,
                  onPressed: onPressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';

class PrizeListNavigationBarTitle extends StatelessWidget{
  final String titleText;
  final VoidCallback backOnTap;
  final Color tintColor;

  const PrizeListNavigationBarTitle({super.key, required this.titleText,required this.backOnTap,required this.tintColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        backOnTap()
      },
      child: Padding(
        padding: const EdgeInsets.only(left:8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.arrow_back_ios, color: tintColor),
            Text(titleText,style: AppTextStyle.title.copyWith(color: tintColor),)
          ],
        ),
      ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Icon(Icons.arrow_back_ios, color: tintColor),
      //     Text(titleText,style: AppTextStyle.title.copyWith(color: tintColor),)
      //   ],
      // ),
    );
  }
}

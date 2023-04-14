import 'package:flutter/widgets.dart';
import '../utils/app_layout.dart';

class WelcomeScreenRow extends StatelessWidget {
  final String assetImgUri;
  final String title;
  final String des;

  const WelcomeScreenRow(
      {super.key,
      required this.assetImgUri,
      required this.title,
      required this.des});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: AppLayout.width(32),
        ),
        Image.asset(
          assetImgUri,
          width: AppLayout.height(32),
          height: AppLayout.height(32),
        ),
        SizedBox(
          width: AppLayout.height(16),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.title,
              ),
              Text(
                des,
                style: AppTextStyle.subTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(
          width: AppLayout.width(32),
        )
      ],
    );
  }
}

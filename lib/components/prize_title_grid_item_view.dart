import 'package:apple_fitness_flutter/entities/prize_page_item_entity.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/widgets.dart';

typedef PrizeItemOnClick = Function(PrizeItemEntity);

class PrizeItemGridItemView extends StatelessWidget {
  final PrizeItemEntity prizeItem;
  final PrizeItemOnClick onClick;
  const PrizeItemGridItemView(
      {Key? key, required this.prizeItem, required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? archivedColor = prizeItem.archived ? null : AppColor.gray2;

    return GestureDetector(
        onTap: () => onClick(prizeItem),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              prizeItem.iconName,
              width: AppLayout.width(80),
              height: AppLayout.width(80),
              color: archivedColor,
              fit: BoxFit.contain,
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: AppLayout.height(4),
                  left: AppLayout.height(4),
                  right: AppLayout.height(4)),
              child: Text(
                prizeItem.title,
                style: AppTextStyle.title.copyWith(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: AppLayout.height(0),
              ),
              child: Text(
                prizeItem.subTitle,
                style: AppTextStyle.subtitle4
                    .copyWith(fontSize: 15, color: AppColor.gray1),
              ),
            )
          ],
        ));
  }
}

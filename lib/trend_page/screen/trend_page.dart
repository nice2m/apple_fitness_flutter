import 'package:apple_fitness_flutter/components/fapp_bar.dart';
import 'package:apple_fitness_flutter/trend_page/component/trend_sections.dart';
import 'package:apple_fitness_flutter/trend_page/entity/trend_entity.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';

class TrendPage extends StatefulWidget {
  const TrendPage({Key? key}) : super(key: key);

  @override
  State<TrendPage> createState() => _TrendPageState();
}

class _TrendPageState extends State<TrendPage> {
  late List<TrendSectionEntity> dataList = [];

  dynamic val;
  @override
  void initState() {
    super.initState();
    print("initState");

    TrendSectionEntity.data()
    .then((value){
      setState(() {
        dataList = value;
        _buildTrendSections();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryContainerBg,
      appBar: FAppBar.backTitled("趋势", () {
        Navigator.of(context).pop();
      }, null),
      body: CustomScrollView(
        slivers: _buildTrendSections(),
      )
    );
  }

  _buildTrendSections() {
    if (dataList.isEmpty) {
      return [
        const SliverToBoxAdapter(
          child:  Text("数据加载中~",style: AppTextStyle.subtitle5,)
        )
       ];
    }
    final retList =  dataList.map((e) => SliverToBoxAdapter(
      child: TrendSection(entity: e),
    )).toList();
    retList.add( SliverToBoxAdapter(
      child: Text(
        "\"趋势\"可比较过去90天和过去365天的健身状况。如果表现持平或更佳，箭头会向上。如果表现有所欠缺，箭头会向下。你可以在此处进一步了解\"趋势\"。",
        style: AppTextStyle.subtitle15.copyWith(fontWeight: FontWeight.w400),)
    ));
    return retList;
  }
}

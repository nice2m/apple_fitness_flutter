
import 'package:apple_fitness_flutter/trend_page/component/trend_row.dart';
import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';

import '../entity/trend_entity.dart';

class TrendSection extends StatefulWidget {
  final TrendSectionEntity entity;
  const TrendSection({Key? key,required this.entity}) : super(key: key);

  @override
  State<TrendSection> createState() => _TrendSectionState();
}

class _TrendSectionState extends State<TrendSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: _buildRowChildren(),
    );
  }

  List<Widget> _buildRowChildren() {
    List<Widget> rows = [];
    rows.add(SizedBox(height: AppLayout.height(12),));
    final titleText = Text(widget.entity.title,
      style: AppTextStyle.headLine1.copyWith(fontSize: 24),
    );
    rows.add(titleText);
    rows.add(SizedBox(height: AppLayout.height(6),));
    rows.addAll(widget.entity.items.map((entity) => TrendRow(entity: entity)));

    rows.add(const SizedBox(height: 6));
    return rows;
  }
}

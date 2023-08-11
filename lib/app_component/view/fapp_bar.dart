import 'package:apple_fitness_flutter/utils/app_layout.dart';
import 'package:flutter/material.dart';

class FAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? backTitle;
  final Image? backIcon;
  final Color? tintColor;
  final VoidCallback? backOnClick;
  final Widget? title;
  final List<Widget>? actions;

  const FAppBar({super.key, this.backTitle, this.backIcon, this.title, this.backOnClick, this.tintColor = AppColor.primary,this.actions});

  static FAppBar backTitled(String backTitle,VoidCallback backOnClick,List<Widget>? actions) {
    return FAppBar(
      backTitle: backTitle,
      backIcon: Image.asset("assets/images/icon_back.png",
        fit: BoxFit.contain,color: AppColor.primary,
        height: AppLayout.height(24),
        width: AppLayout.width(24),
      ),
      backOnClick: backOnClick,
      actions: actions,
    );

  }
  @override
  State<FAppBar> createState() => _FAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _FAppBarState extends State<FAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.primaryBlack,
      leadingWidth: double.infinity,
      automaticallyImplyLeading: false,
      title: widget.title,
      actions: widget.actions,
      // back
      leading: GestureDetector(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.backIcon != null ? widget.backIcon! : SizedBox.fromSize(size: Size.zero),
            SizedBox(width: AppLayout.width(4),),
            widget.backTitle != null ? Text("${widget.backTitle}",style: AppTextStyle.title.copyWith(color: widget.tintColor)): SizedBox.fromSize(size: Size.zero),
          ],
        ),
        onTap: () {
          widget.backOnClick != null ? widget.backOnClick!() : null ;
        },),
    );

  }
}
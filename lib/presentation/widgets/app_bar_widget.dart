import 'package:flutter/material.dart';
import 'package:my_hub_user/core/color/app_colors.dart';
import 'package:my_hub_user/core/theme/theme_text.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final bool isHiddenClose;
  final bool? isShowDone;
  final Function()? onTapDone;
  @override
  Size get preferredSize => const Size.fromHeight(60);
  const AppBarWidget(
      {Key? key,
      required this.title,
      this.subTitle,
      this.isHiddenClose = false,
      this.isShowDone = false,
      this.onTapDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      centerTitle: true,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,
              style: AppThemeText.themeText.headline6
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
        ],
      ),
      leading: isShowDone!
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
            )
          : const SizedBox(),
      leadingWidth: 100,
      actions: [
        isHiddenClose
            ? IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
              )
            : IgnorePointer()
      ],
    );
  }
}

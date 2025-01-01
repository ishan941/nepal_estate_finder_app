import 'package:flutter/material.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/utils/color_util.dart';
import 'package:provider_with_clean_architecture/core/utils/nef_spacing.dart';
import 'package:provider_with_clean_architecture/core/utils/nef_text_util.dart';

class NefAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final List<Widget>? actions;
  final bool showBackButton;

  final VoidCallback? onFilterPressed;
  final VoidCallback? onDownloadPressed;
  final VoidCallback? onProfilePressed;
  final VoidCallback? onBackButtonPressed;
  int? count;
  NefAppBar({
    Key? key,
    required this.title,
    this.count,
    this.backgroundColor = Colors.blue,
    this.actions,
    this.onDownloadPressed,
    this.showBackButton = true,
    this.onFilterPressed,
    this.onBackButtonPressed,
    this.onProfilePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(title, style: const TextStyle(color: whiteColor)),
      backgroundColor: primaryColor,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: NefSpacing.spacing5,
              ),
              onPressed: onBackButtonPressed ??
                  () {
                    Navigator.of(context).pop();
                  },
            )
          : null,
      actions: [
        ...?actions,
        if (onFilterPressed != null)
          IconButton(
            icon: const Icon(Icons.format_align_right, color: Colors.white),
            onPressed: onFilterPressed,
          ),
        if (onDownloadPressed != null)
          IconButton(
            icon: const Icon(Icons.download_sharp, color: Colors.white),
            onPressed: onDownloadPressed,
          ),
        if (onProfilePressed != null)
          NefPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Stack(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                  onPressed: onProfilePressed,
                ),
                if (count != 0)
                  Positioned(
                    right: 2,
                    top: 2,
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.red,
                      child: Center(
                        child: NefTextUtil(
                          text: "$count",
                          textColor: whiteColor,
                          fontSize: 8,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

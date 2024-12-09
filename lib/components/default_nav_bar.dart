import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:gem_mvp/models/bottom_nav_bar/nav_bar_model.dart';

import '../constants/app_colors.dart';

class DefaultNavBar extends StatelessWidget {
  final List<BottomNavBarData> navItems;
  final int selectedIndex;

  const DefaultNavBar({
    required this.navItems,
    required this.selectedIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    return Container(
      clipBehavior: Clip.none,
      height: 63,
      margin: EdgeInsets.only(bottom: bottomPadding),
      padding: const EdgeInsets.only(top: 10),
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey.shade300,
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        children: List.generate(navItems.length, (index) {
          final item = navItems[index];
          final isSelected = index == selectedIndex;
          return Expanded(
            child: InkWell(
              onTap: () => 0,
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Center(
                      child: _buildIcon(context, item, isSelected),
                    ),
                  ),
                  Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: textTheme.labelLarge!.copyWith(
                      fontWeight: FontWeight.w500,
                      color:
                          isSelected ? AppColors.metallicBlue : AppColors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildIcon(
    BuildContext context,
    BottomNavBarData item,
    bool isSelected,
  ) {
    // final iconColor = isSelected ? AppColors.secondaryColor : Color(0xff2E323E);

    return SvgPicture.asset(
      item.iconPath!,
      width: 25,
      colorFilter: const ColorFilter.mode(
        AppColors.metallicBlue,
        BlendMode.srcIn,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gem_mvp/constants/app_colors.dart';
import 'package:gem_mvp/generated/locale_keys.g.dart';
import 'package:gem_mvp/generated/localization.dart';
import 'package:gem_mvp/views/home_page/widgets/event_card.dart';

class EventSection extends StatelessWidget {
  const EventSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      height: 260,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.upcomingEvents.tr(),
                  style: textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.pumpkin,
                      fontFamily: 'Inter'),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    LocaleKeys.seeAll.tr(),
                    style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkGray,
                        fontFamily: 'Inter'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              clipBehavior: Clip.antiAlias,
              physics: const ScrollPhysics(),
              padding: const EdgeInsetsDirectional.only(
                  start: 10, end: 10, bottom: 3, top: 5),
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const EventCard();
              },
              separatorBuilder: (context, index) => const Divider(
                thickness: 0,
                indent: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

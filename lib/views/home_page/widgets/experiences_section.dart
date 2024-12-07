import 'package:flutter/material.dart';
import 'package:gem_mvp/constants/app_colors.dart';
import 'package:gem_mvp/generated/locale_keys.g.dart';
import 'package:gem_mvp/generated/localization.dart';
import 'package:gem_mvp/views/home_page/widgets/experiences_card.dart';

class ExperiencesSection extends StatelessWidget {
  const ExperiencesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        15,
        0,
        15,
        0,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                LocaleKeys.availableExperiences.tr(),
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
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 323,
            child: ListView.separated(
                clipBehavior: Clip.none,
                addRepaintBoundaries: false,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const ExperiencesCard();
                },
                separatorBuilder: (context, index) => const VerticalDivider(
                      thickness: 0,
                    )),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gem_mvp/constants/app_colors.dart';
import 'package:gem_mvp/generated/assets.gen.dart';
import 'package:gem_mvp/generated/locale_keys.g.dart';
import 'package:gem_mvp/generated/localization.dart';

class ExperiencesCard extends StatelessWidget {
  const ExperiencesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 210,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 5, // How much the shadow spreads
            blurRadius: 8, // Blur effect of the shadow
            offset: const Offset(0, 6), // Position of the shadow (x, y)
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                child: Assets.png.cMBannerEn.image(),
              ),
              Positioned(
                top: 10,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.bookmark_border),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Gem Main Galleries',
              style: textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.metallicBlue,
                  fontFamily: 'Inter'),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              '90-minute',
              style: textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w300,
                  color: AppColors.metallicBlue,
                  fontFamily: 'Inter'),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  LocaleKeys.viewMore.tr(),
                  style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: AppColors.metallicBlue,
                      fontFamily: 'Inter'),
                ),
                const Icon(Icons.arrow_forward_ios_outlined),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

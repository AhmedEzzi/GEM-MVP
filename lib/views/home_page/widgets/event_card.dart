import 'package:flutter/material.dart';
import 'package:gem_mvp/constants/app_colors.dart';
import 'package:gem_mvp/generated/assets.gen.dart';
import 'package:gem_mvp/helpers/date_formatter.dart';

class EventCard extends StatelessWidget {
  const EventCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final DateTime dateTime = DateTime(2024, 11, 10, 22);
    final String formattedDate = eventDate(dateTime);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 2, // How much the shadow spreads
            blurRadius: 8, // Blur effect of the shadow
            offset: const Offset(0, 4), // Position of the shadow (x, y)
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 11),
        child: Row(
          children: [
            Assets.png.volunteerDayPhoto.image(),
            Column(
              children: [
                Text(
                  'International Volunteer Day',
                  style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.black,
                      fontFamily: 'Poppins'),
                ),
                Row(
                  children: [
                    const SizedBox(width: 20),
                    Text(
                      formattedDate,
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColors.black,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Chip(
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: AppColors.price,
                      label: Text(
                        '30£',
                        style: textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.metallicBlue,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

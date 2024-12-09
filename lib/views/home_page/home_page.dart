import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gem_mvp/components/default_nav_bar.dart';
import 'package:gem_mvp/models/bottom_nav_bar/nav_bar_model.dart';
import 'package:gem_mvp/views/home_page/widgets/custom_app_bar.dart';

import 'package:gem_mvp/views/home_page/widgets/custom_banner.dart';
import 'package:gem_mvp/views/home_page/widgets/event_section.dart';
import 'package:gem_mvp/views/home_page/widgets/experiences_section.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: ListView(
        children: const [
          DynamicBanner(),
          // Add other sections as needed
          EventSection(),
          SizedBox(height: 16),
          ExperiencesSection(),
          SizedBox(height: 26),
        ],
      ),
      bottomNavigationBar: DefaultNavBar(
          navItems: BottomNavBarData.navBarData, selectedIndex: 0),
    );
  }
}

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'package:gem_mvp/views/home_page/widgets/custom_app_bar.dart';
import 'package:gem_mvp/views/home_page/widgets/event_section.dart';
import 'package:gem_mvp/views/home_page/widgets/experiences_section.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: ListView(
        children: const [
          // const Padding(
          //   padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          // ),
          EventSection(),
          SizedBox(height: 16),
          ExperiencesSection()
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:gem_mvp/generated/assets.gen.dart';
import 'package:gem_mvp/views/splash_page/splash_page.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Assets.png.logo.image(),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () async {
              // Get the position of the icon to show the menu correctly
              final RenderBox button = context.findRenderObject() as RenderBox;
              final Offset offset = button.localToGlobal(Offset.zero);
              _showPopupMenu(context, offset);
            },
          ),
        ],
      ),
    ));
  }

  void _showPopupMenu(BuildContext context, Offset offset) async {
    final result = await showMenu(
      color: Colors.white,
      popUpAnimationStyle: AnimationStyle(curve: Curves.easeInToLinear),
      context: context,
      position: RelativeRect.fromDirectional(
          textDirection: TextDirection.rtl,
          start: 15,
          top: 92,
          end: 20,
          bottom: 3),
      items: [
        const PopupMenuItem(
          value: "Profile",
          child: Text(
            "Profile",
          ),
        ),
        const PopupMenuItem(
          value: "Tickets",
          child: Text("Tickets"),
        ),
        const PopupMenuItem(
          value: "Login",
          child: Text("Login"),
        ),
        const PopupMenuItem(
          value: "More",
          child: Text("More"),
        ),
      ],
    );
    if (result != null) {
      print("Selected: $result");
      _navigateToPage(context, result);
    }
  }
}

void _navigateToPage(BuildContext context, String selectedOption) {
  switch (selectedOption) {
    case "Profile":
      // Navigate to Profile Page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SplashPage()),
      );
      break;
    case "Tickets":
      // Navigate to Tickets Page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SplashPage()),
      );
      break;
    case "Login":
      // Navigate to Login Page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SplashPage()),
      );
      break;
    case "More":
      // Navigate to More Page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SplashPage()),
      );
      break;
    default:
      break;
  }
}

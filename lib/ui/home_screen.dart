import 'package:event_planning_ass/ui/tabs/home_tab.dart';
import 'package:event_planning_ass/ui/tabs/love_tab.dart';
import 'package:event_planning_ass/ui/tabs/map_tab.dart';
import 'package:event_planning_ass/ui/tabs/profile_tab.dart';
import 'package:event_planning_ass/utilis/app_colors.dart';
import 'package:event_planning_ass/utilis/asset_manager.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String homeScreenId = "HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), MapTab(), LoveTab(), profileTab()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Image.asset(AssetManager.iconAdded),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
        child: BottomAppBar(
          color: Theme.of(context).primaryColor,
          padding: EdgeInsets.zero,
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: BottomNavigationBar(
              currentIndex: selectedIndex,
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              items: [
                buildBottomNavBarItem(
                    index: 0,
                    imageIconSelected: AssetManager.selectedHomeIcon,
                    imageIcon: AssetManager.homeIcon,
                    label: "Home"),
                buildBottomNavBarItem(
                    index: 1,
                    imageIconSelected: AssetManager.selectedMapIcon,
                    imageIcon: AssetManager.mapIcon,
                    label: "Map"),
                buildBottomNavBarItem(
                    index: 2,
                    imageIconSelected: AssetManager.selectedHeartIcon,
                    imageIcon: AssetManager.heartIcon,
                    label: "Love"),
                buildBottomNavBarItem(
                    index: 3,
                    imageIconSelected: AssetManager.selectedProfileIcon,
                    imageIcon: AssetManager.userProfile,
                    label: "Profile"),
              ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[selectedIndex],
    );
  }

  BottomNavigationBarItem buildBottomNavBarItem(
      {required String label,
      required int index,
      required String imageIcon,
      required String imageIconSelected}) {
    return BottomNavigationBarItem(
        icon:
            Image.asset(selectedIndex == index ? imageIconSelected : imageIcon),
        label: label);
  }
}

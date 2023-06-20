import 'package:bazaarboxapp/providers/navbar_provider.dart';
import 'package:bazaarboxapp/views/about.dart';
import 'package:bazaarboxapp/views/add_item.dart';
import 'package:bazaarboxapp/views/home.dart';
import 'package:bazaarboxapp/views/search.dart';
import 'package:bazaarboxapp/views/update_item.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  List<dynamic> screens = [
    const HomeScreen(),
    const SearchScreen(),
    AddItemScreen(),
    const AboutScreen()
  ];

  MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationBarProvider>(
      builder: (context, bottomNavBarProvider, child) {
        return Scaffold(
          body: screens[bottomNavBarProvider.currentIndex],
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: Consumer<BottomNavigationBarProvider>(
              builder: (context, bottomNavBarProvider, child) {
                return BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                    //selectedItemColor: Colors.black,
                    showUnselectedLabels: false,
                    showSelectedLabels: false,
                    currentIndex: bottomNavBarProvider.currentIndex,

                    //currentIndex: Controller.index,
                    onTap: (index) {
                      bottomNavBarProvider.updateCurrentIndex(index);
                    },
                    items: const [
                      BottomNavigationBarItem(
                          label: "Home",
                          icon: Icon(Icons.home),
                          activeIcon: Icon(Icons.home_work_outlined)),
                      BottomNavigationBarItem(
                          label: "Search",
                          icon: Icon(Icons.search),
                          activeIcon: Icon(Icons.search_off_rounded)),
                      BottomNavigationBarItem(
                          label: "Add Item",
                          icon: Icon(Icons.add),
                          activeIcon: Icon(Icons.add_box)),
                      BottomNavigationBarItem(
                          label: "About",
                          icon: Icon(Icons.info),
                          activeIcon: Icon(Icons.info_outline_rounded)),
                    ]);
              },
            ),
          ),
        );
      },
    );
  }
}

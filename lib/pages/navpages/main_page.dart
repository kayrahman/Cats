import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_dart/pages/navpages/courses_page.dart';
import 'package:learning_dart/pages/navpages/home_page.dart';
import 'package:learning_dart/pages/navpages/profile_page.dart';
import 'package:learning_dart/pages/navpages/saved_page.dart';

import '../../cubit/app_cubits.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AppCubits>(context).fetchCats();
  }

  List pages = [HomePage(), CoursesPage(), SavedPage(), ProfilePage()];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(
              label: "Courses", icon: Icon(Icons.menu_book)),
          BottomNavigationBarItem(
              label: "Bookmark", icon: Icon(Icons.bookmark)),
          BottomNavigationBarItem(label: "Account", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}

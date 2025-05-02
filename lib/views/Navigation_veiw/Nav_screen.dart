import 'package:badi/views/Home_views/Home_screen.dart';
import 'package:badi/views/Navigation_veiw/bottomNavigation_widget.dart';
import 'package:badi/views/Profile_view/profile_screen.dart';
import 'package:badi/views/Search_view/search_screen.dart';
import 'package:badi/views/Whitelisted_view/whitelisted_screen.dart';
import 'package:flutter/material.dart';


// SCREEN OF THE NAVIGATION BAR THE HOLD ALL THE SCREENS 
class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}
class _NavScreenState extends State<NavScreen> {


  int _currentIndex = 0;

  final List<Widget> _screen = [
    HomeScreen(property: [],),
    SearchScreen(),
    WhitelistedScreen(),
    ProfileScreen(),
  ];

  void _whentapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _screen,
      ),

      bottomNavigationBar: BottomnavigationWidget(
        selectedIndex: _currentIndex, 
        whentapped: _whentapped )
      );
    
  }
}
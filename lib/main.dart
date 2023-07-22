import 'package:acrosstheglobe_assignment1/constants/image_icon.dart';
import 'package:acrosstheglobe_assignment1/screens/chat_screen.dart';
import 'package:acrosstheglobe_assignment1/screens/home_screen.dart';
import 'package:acrosstheglobe_assignment1/screens/hub_screen.dart';
import 'package:acrosstheglobe_assignment1/screens/learn_screen.dart';
import 'package:acrosstheglobe_assignment1/screens/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CustomNavigator(),
    );
  }
}

class CustomNavigator extends StatefulWidget {
  const CustomNavigator({super.key});

  @override
  State<CustomNavigator> createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator> {
  int _selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    LearnScreen(),
    HubScreen(),
    ChatScreen(),
    ProfileScreen()
  ];
  void changeScreen(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        items: [
          //home icon
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(ImageIcons().home),
            ),
            label: 'Home',
            activeIcon: ImageIcon(
              AssetImage(ImageIcons().homeSelect),
            ),
          ),
          //book icon
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(ImageIcons().book),
            ),
            label: 'Learn',
            activeIcon: ImageIcon(
              AssetImage(ImageIcons().bookSelect),
            ),
          ),
          //hub icon
          BottomNavigationBarItem(
            icon: ImageIcon(
              
              AssetImage(ImageIcons().hub),
            ),
            label: 'Hub',
            activeIcon: ImageIcon( 
              AssetImage(ImageIcons().hubSelect),
            ),
          ),
          //chat icon
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage(ImageIcons().chatBubble),
            ),
            label: 'Chat',
            activeIcon: ImageIcon( 
              AssetImage(ImageIcons().chatBubbleSelect),
            ),
          ),
          //profile icon
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xffdee8fb),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: CircleAvatar(backgroundColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(1),
                    child: CircleAvatar(
                      backgroundImage: AssetImage(ImageIcons().profile),
                    ),
                  ),
                ),
              ),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          changeScreen(index);
        },
      ),
      body: screens.elementAt(_selectedIndex),
    );
  }
}

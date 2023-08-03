import 'package:acrosstheglobe_assignment1/constants/image_icon.dart';
import 'package:acrosstheglobe_assignment1/controller/lessons_provider.dart';
import 'package:acrosstheglobe_assignment1/screens/chat_screen.dart';
import 'package:acrosstheglobe_assignment1/screens/home_screen.dart';
import 'package:acrosstheglobe_assignment1/screens/hub_screen.dart';
import 'package:acrosstheglobe_assignment1/screens/learn_screen.dart';
import 'package:acrosstheglobe_assignment1/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/programs_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProgramsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LessonProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CustomNavigator(),
      ),
    );
  }
}

class CustomNavigator extends StatefulWidget {
  const CustomNavigator({super.key});

  @override
  State<CustomNavigator> createState() => _CustomNavigatorState();
}

class _CustomNavigatorState extends State<CustomNavigator> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProgramsProvider>(context, listen: false).getPrograms(context);
      Provider.of<LessonProvider>(context, listen: false).getLessons(context);
    });

    super.initState();
  }

  int _selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    const LearnScreen(),
    const HubScreen(),
    const ChatScreen(),
    const ProfileScreen()
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
              backgroundColor:const Color(0xffdee8fb),
              child: Padding(
                padding: const EdgeInsets.all(2),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
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

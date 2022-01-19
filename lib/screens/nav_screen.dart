import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_net_clone/cubits/cubits.dart';
import 'package:flutter_net_clone/screens/screens.dart';
import 'package:flutter_net_clone/widgets/widgets.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screenList = [
    const HomeScreen(
      key: PageStorageKey("homeScreen"),
    ),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final Map<String, IconData> _icons = const {
    "Home": Icons.home,
    "Search": Icons.search,
    "Comming Soon": Icons.queue_play_next_outlined,
    "Downloads": Icons.file_download,
    "More": Icons.menu,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<AppBarCubit>(
        create: (_) => AppBarCubit(),
        child: _screenList[_currentIndex],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              items: _icons
                  .map((title, icon) => MapEntry(
                        title,
                        BottomNavigationBarItem(
                            icon: Icon(
                              icon,
                              size: 30.0,
                            ),
                            label: title),
                      ))
                  .values
                  .toList(),
              selectedItemColor: Colors.white,
              selectedFontSize: 11.0,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 11.0,
              backgroundColor: Colors.black,
              onTap: (index) => setState(() => _currentIndex = index),
            )
          : null,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/utils/color_util.dart';
import 'package:provider_with_clean_architecture/core/utils/nef_spacing.dart';
import 'package:provider_with_clean_architecture/features/home_page/home_page.dart';
import 'package:provider_with_clean_architecture/features/profile/profile_page.dart';

class NefNavBar extends ConsumerStatefulWidget {
  final int selectedIndex;

  const NefNavBar({super.key, this.selectedIndex = 0});

  @override
  _NefNavBarState createState() => _NefNavBarState();
}

class _NefNavBarState extends ConsumerState<NefNavBar> {
  late int _selectedIndex;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HomePage(),
    HomePage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final navState = ref.watch(navbarNotifierProvider);

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "homeStr",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.view_timeline_outlined),
              label: "meritPointStr",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today_outlined),
              label: "calenderStr",
            ),
            BottomNavigationBarItem(
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: SizedBox(
                  height: NefSpacing.spacing5,
                  width: NefSpacing.spacing5,
                  child: Image.asset(
                    "assets/images/avatar.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              label: "profileStr",
            ),
          ],
          currentIndex: _selectedIndex,
          backgroundColor: whiteColor,
          unselectedIconTheme: const IconThemeData(size: 20),
          selectedIconTheme: const IconThemeData(size: 20),
          elevation: 5,
          unselectedItemColor: greyColor.withOpacity(0.5),
          unselectedLabelStyle: TextStyle(
            color: greyColor.withOpacity(0.5),
            fontSize: 14,
          ),
          selectedItemColor: primaryColor,
          showUnselectedLabels: true,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          selectedLabelStyle: const TextStyle(
            color: primaryColor,
            fontSize: 14,
          ),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

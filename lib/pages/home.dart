import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:doctor_app/pages/Doctor/appointmentPage.dart';
import 'package:doctor_app/pages/chat_page.dart';
import 'package:doctor_app/pages/people.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'accountPage.dart';
import 'doctor_page.dart';
import 'home_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> _pages = [
    HomePage(),
    DoctorPage(),
    ChatPage(),
    AppointmentsPage(),
    ProfileScrean()
  ];

  int _currentIndex = 0;
  PageController _pageController = new PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SizedBox.expand(
          child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentIndex = index);
              },
              children: _pages),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: Text(
                  'الرئيسية',
                  style: subTitle,
                ),
                icon: Icon(Icons.home)),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: Text(
                  'الأطباء',
                  style: subTitle,
                ),
                icon: Icon(Icons.medical_services_rounded)),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: Text(
                  'الاستشارات',
                  style: subTitle,
                ),
                icon: Icon(CupertinoIcons.chat_bubble_2_fill)),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: Text(
                  'الحجوزات',
                  style: subTitle,
                ),
                icon: Icon(Icons.event_note_rounded)),
            BottomNavyBarItem(
                activeColor: primary,
                inactiveColor: Colors.black,
                title: Text(
                  'حسابي',
                  style: subTitle,
                ),
                icon: Icon(Icons.manage_accounts_rounded)),
          ],
        ),
      ),
    );
  }
}

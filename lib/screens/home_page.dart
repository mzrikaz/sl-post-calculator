import 'package:flutter/material.dart';
import 'package:sl_post_air_mail_calculator/screens/cod.dart';

import '../widgets/country_selector.dart';
import '../widgets/number_pad.dart';
import 'pages/air_mail.dart';
import 'pages/local_mail.dart';
import 'pages/sea_mail.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final _pageController = PageController();

  void _changeIndex(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: FittedBox(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'SL Post Calculator',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "v2.0",
                  style: TextStyle(fontSize: 9),
                ),
              ],
            ),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(240),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: NumberPad(),
          ),
        ),
        centerTitle: false,
        actions: [
          CountrySelector(),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _changeIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.mail,
            ),
            label: "Local",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: "Air Mail",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.safety_check),
            label: "Sea Mail",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.safety_check),
            label: "COD",
          ),
        ],
      ),
      body: Container(
        color: Color(0xFFd4d4b0),
        padding: const EdgeInsets.all(10),
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) => setState(() {
            _selectedIndex = index;
          }),
          children: [
            LocalMail(),
            AirMail(),
            SeaMail(),
            Cod(),
          ],
        ),
      ),
    );
  }
}

import 'package:cospick/screens/login.dart';
import 'package:cospick/screens/writecos.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kakao_flutter_sdk/all.dart';
import 'package:cospick/screens/search.dart';

const kakaoapikey = '675e0d7545f6d2732848513c830dda4a';
void main() {
  KakaoContext.clientId = kakaoapikey;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'C O S P I C K'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'home',
      style: optionStyle,
    ),
    Search(),
    WriteCos(),
    Text(
      'bookmark',
      style: optionStyle,
    ),
    Mylogin()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: Container(
        height: 50,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0x3f000000),
              blurRadius: 4,
              offset: Offset(0, -4),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          )
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          child: BottomNavigationBar(

            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/icon_home.png'),
                  label: "",
                  activeIcon: Image.asset('assets/icons/icon_home_on.png'),
              ),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/icon_search.png'),
                  activeIcon: Image.asset('assets/icons/icon_search_on.png'),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/icon_write_off.png'),
                  activeIcon: Image.asset('assets/icons/icon_write_on.png'),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/icon_bookmark.png'),
                  activeIcon: Image.asset('assets/icons/icon_bookmark_on.png'),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/icon_user.png'),
                  label: "",
                  activeIcon: Image.asset('assets/icons/icon_user_on.png'),
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
          ),
        )
      )
    );
  }
}

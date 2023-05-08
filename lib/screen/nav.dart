import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import '../login/home.dart';
import 'build/build.dart';
// ignore: unused_import
import 'home/home.dart';
import 'profil/profil.dart';

const _kPages = <String, Widget>{
  'profil': ProfilPage(),
  'Home': HomePage(),
  'Build': BuildPage(),
};

class NavPage extends StatefulWidget {
  const NavPage({required Key key}) : super(key: key);

  @override
  _NavPageState createState() => _NavPageState();
}

class _NavPageState extends State<NavPage> {
  TabStyle _tabStyle = TabStyle.reactCircle;
  Color back = Colors.black;

  final List<Widget> _pages = [
    for (final page in _kPages.values)
      page,
  ];
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _kPages.length,
      initialIndex: _selectedIndex,
      child: Scaffold(
        body: TabBarView(
          children: _pages,
        ),
        bottomNavigationBar: ConvexAppBar(
          style: _tabStyle,
          backgroundColor: Colors.black,
          items: const <TabItem>[
            TabItem(
              icon: Icon(
                Icons.account_box_sharp,
                color: Colors.white,
              ),
              title: 'profil',
            ),
            TabItem(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              title: 'Home',
            ),
            TabItem(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              title: 'Build',
            ),
          ],
          color: Colors.white,
          activeColor: const Color.fromARGB(255, 76, 86, 139),
          onTap: (int i) {
            setState(() {
              _selectedIndex = i;
            });
          },
        ),
      ),
    );
  }
}
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

import 'build/build.dart';
import 'home/home.dart';
import 'profil/profil.dart';

const _kPages = <String, Widget>{
  'profil': ProfilPage(),
  'Home': AddPage(),
  'Build': BuildPage(),
};

class NavPage extends StatefulWidget {
  const NavPage({super.key});

  @override
  _NavPage createState() => _NavPage();
}

class _NavPage extends State<NavPage> {
  TabStyle _tabStyle = TabStyle.reactCircle;
  Color back = Colors.black;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  for (final icon in _kPages.values) icon,
                ],
              ),
            ),
          ],
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
          onTap: (int i) => print('click index=$i'),
        ),
      ),
    );
  }
}
/*import 'package:flutter/material.dart';

import 'chat/chat.dart';
import 'status/statut.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  Color mainColor = Color.fromARGB(255, 255, 255, 255);

  final PageController _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          StatusPage(),
          ChatPage(),
          StatusPage(),
          //CommunityPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mainColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: 'Statut',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Discussion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Statut',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        },
      ),
    );
  }
}*/

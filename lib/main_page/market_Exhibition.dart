import 'package:flutter/material.dart';
import 'package:flutter_yerism_app/main_page/display.dart';
import 'package:flutter_yerism_app/main_page/artist.dart';
import 'package:flutter_yerism_app/main_page/search.dart';
import 'package:flutter_yerism_app/main_page/MY.dart';

class MarketExhibitionPage extends StatefulWidget {
  @override
  _MarketExhibitionPageState createState() => _MarketExhibitionPageState();
}

class _MarketExhibitionPageState extends State<MarketExhibitionPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Stack(
      children: [
        Align(
          alignment: Alignment(0.8, 0.6),
          child: Text(
            '프랏차야 핀통 개인전\n'
            '<내일을 돌보는 오늘>\n'
            '바라캇 컨템포러리',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    DisplayPage(),
    ArtistPage(),
    SearchPage(),
    MyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_currentIndex == 0)
            Positioned.fill(
              child: Image.asset(
                'lib/img/v19.png',
                fit: BoxFit.cover,
              ),
            ),
          _pages[_currentIndex],
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '마켓',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '전시',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '작가',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: '검색',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(),
            label: 'MY',
          ),
        ],
        backgroundColor: Colors.black,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_yerism_app/signuplogin/login.dart';
import 'package:flutter_yerism_app/signuplogin/signup.dart'; // signup.dart 추가

class OnboardingPages extends StatefulWidget {
  @override
  _OnboardingPagesState createState() => _OnboardingPagesState();
}

class _OnboardingPagesState extends State<OnboardingPages> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              Onboarding(imagePath: 'lib/img/obd.png'), // 첫 번째 화면
              Onboarding(imagePath: 'lib/img/obd2.png'), // 두 번째 화면
              Onboarding(imagePath: 'lib/img/obd3.png'), // 세 번째 화면
              Onboarding(imagePath: 'lib/img/obd4.png'), // 네 번째 화면
              FinalOnboardingScreen(), // 다섯 번째 화면
            ],
          ),

          // 왼쪽 버튼
          if (_currentPage > 0)
            Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height / 2 - 30,
              child: GestureDetector(
                onTap: () {
                  _controller.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Opacity(
                  opacity: 0.7, // 반투명 효과
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black, // 버튼 배경색
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),

          // 오른쪽 버튼
          if (_currentPage < 4)
            Positioned(
              right: 10,
              top: MediaQuery.of(context).size.height / 2 - 30,
              child: GestureDetector(
                onTap: () {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Opacity(
                  opacity: 0.7, // 반투명 효과
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black, // 버튼 배경색
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class Onboarding extends StatelessWidget {
  final String imagePath;

  const Onboarding({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath), // 배경 이미지 경로
          fit: BoxFit.cover, // 이미지 크기 조정
        ),
      ),
    );
  }
}

// 다섯 번째 화면 (버튼 포함)
class FinalOnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/img/obd5.png'), // 배경 이미지
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // 중앙 상단에 텍스트 추가
          Positioned(
            top: 100, // 화면 상단에서 100px 아래
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'YERISM의  세계에  오신것을  환영합니다.당신을 위한 공간에서 예술의 본질을 발견하세요. 여정을 시작합니다.',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // 텍스트 색상
                  shadows: [
                    Shadow(
                      offset: Offset(1, 1),
                      blurRadius: 3,
                      color: Colors.white, // 텍스트에 흰색 그림자 추가
                    ),
                  ],
                ),
              ),
            ),
          ),
          // 하단 버튼 추가
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Center(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // 갈색 버튼
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 170),
                ),
                onPressed: () {
                  // 하단 시트 표시
                  showModalBottomSheet(
                    context: context,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) {
                      return BottomSheetContent();
                    },
                  );
                },
                child: Text(
                  '시작',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}

// 하단 시트에서 로그인/회원가입 선택
class BottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Center(child: Text('로그인')),
            onTap: () {
              // login.dart로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            title: Center(child: Text('회원가입')),
            onTap: () {
              // signup.dart로 이동
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_yerism_app/main_page/market_Exhibition.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> loginUser(BuildContext context) async {
    try {
      QuerySnapshot userSnapshot = await _firestore
          .collection('accounts')
          .where('email', isEqualTo: emailController.text)
          .where('password', isEqualTo: passwordController.text)
          .get();

      if (userSnapshot.docs.isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('로그인 성공!')),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MarketExhibitionPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('이메일 또는 비밀번호가 잘못되었습니다.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('오류 발생: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '藝RISM',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '로그인',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CustomTextField(
                  label: '이메일 또는 휴대폰 번호', controller: emailController),
              SizedBox(height: 10),
              CustomTextField(
                  label: '비밀번호',
                  controller: passwordController,
                  obscureText: true),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () => loginUser(context), // Firestore 데이터 검증 호출
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    minimumSize: Size(200, 50),
                  ),
                  child: Text(
                    '로그인',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () {
                    //비번찾기 나중에 만들기
                  },
                  child: Text(
                    '비밀번호를 잊으셨나요?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool obscureText;

  const CustomTextField({
    Key? key,
    required this.label,
    required this.controller,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}

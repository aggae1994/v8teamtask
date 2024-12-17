import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserData(BuildContext context) async {
    if (emailController.text.isEmpty ||
        usernameController.text.isEmpty ||
        passwordController.text.isEmpty ||
        nameController.text.isEmpty ||
        contactController.text.isEmpty ||
        birthController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('모든 필드를 입력해주세요!')),
      );
      return;
    }

    try {
      await _firestore.collection('users').add({
        'name': nameController.text,
        'contact': contactController.text,
        'birth': birthController.text,
        'email': emailController.text,
        'username': usernameController.text,
        'password': passwordController.text,
        'created_at': Timestamp.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('회원가입이 완료되었습니다!')),
      );

      Navigator.pop(context);
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
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            '취소',
            style: TextStyle(color: Colors.black),
          ),
        ),
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
                '계정을 생성하세요',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              CustomTextField(label: '이름', controller: nameController),
              SizedBox(height: 10),
              CustomTextField(
                  label: '휴대폰 번호 또는 이메일 주소', controller: contactController),
              SizedBox(height: 10),
              CustomTextField(label: '생년월일', controller: birthController),
              SizedBox(height: 10),
              CustomTextField(label: '이메일', controller: emailController),
              SizedBox(height: 10),
              CustomTextField(label: '아이디', controller: usernameController),
              SizedBox(height: 10),
              CustomTextField(
                label: '비밀번호',
                controller: passwordController,
                obscureText: true,
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: () => saveUserData(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    minimumSize: Size(200, 50),
                  ),
                  child: Text(
                    '회원가입 완료',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
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

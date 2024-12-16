import 'package:flutter/material.dart';

class SBLeePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> galleryImages = [
      'lib/img/v5.png',
      'lib/img/v6.png',
      'lib/img/v7.png',
      'lib/img/v8.png',
      'lib/img/v9.png',
      'lib/img/v3.png',
      'lib/img/v4.png',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('이수민 작가'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        AssetImage('lib/img/artist_profile.png'), // 프로필 이미지
                  ),
                  SizedBox(width: 10),
                  Text(
                    '이수민 작가',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                '영원한 숲은 시간이 흘러도 변하지 않을 것이다. 영원히 내 곁을 지켜줄 것만 같다. 나는 그런 안정감이 필요했는지 모른다.',
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 30),
              Text(
                '이수민 작가 갤러리',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: galleryImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(galleryImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

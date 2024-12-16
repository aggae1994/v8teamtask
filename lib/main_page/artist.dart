import 'package:flutter/material.dart';
import 'package:flutter_yerism_app/artist_page/sblee.dart';
import 'package:flutter_yerism_app/artist_page/lakim.dart';

class ArtistPage extends StatelessWidget {
  final List<String> artistNames = [
    '최혁',
    '김우혁',
    '원두선',
    '이수민',
    'Lena.kim',
    '권영유',
    '최요셉',
    '진경신',
    '이준희',
  ];

  final List<String> natureArtistNames = [
    '박성준',
    '홍길동',
    '이민정',
    '윤가영',
    '최민우',
    '김수진',
  ];

  final List<String> postmodernArtistNames = [
    '이서현',
    '박준호',
    '김유진',
    '정하늘',
    '신태우',
    '윤수민',
    '최강현',
    '김지은',
    '오성민',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '藝RISM 작가',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.filter_alt_outlined, color: Colors.black),
                    label: Text(
                      'Style',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                '초현실 주의',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 30,
                  childAspectRatio: 3.3,
                ),
                itemCount: artistNames.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (artistNames[index] == '이수민') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SBLeePage(),
                          ),
                        );
                      } else if (artistNames[index] == 'Lena.kim') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LakimPage(),
                          ),
                        );
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        artistNames[index],
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                '자연주의',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 30,
                  childAspectRatio: 2.5,
                ),
                itemCount: natureArtistNames.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      natureArtistNames[index],
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              Text(
                '포스트모더니즘',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 30,
                  childAspectRatio: 2.5,
                ),
                itemCount: postmodernArtistNames.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      postmodernArtistNames[index],
                      style: TextStyle(fontSize: 16, color: Colors.black),
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

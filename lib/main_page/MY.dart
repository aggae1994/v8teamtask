import 'package:flutter/material.dart';
import 'package:flutter_yerism_app/detail_page/transport.dart';
import 'package:flutter_yerism_app/detail_page/address.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '藝RIS-MY',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Yujun님',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Divider(),
              ListTile(
                leading: Icon(Icons.person_outline, color: Colors.black),
                title: Text('내 정보'),
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.location_on_outlined, color: Colors.black),
                title: Text('나의 주소록'),
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddressPage(),
                    ),
                  );
                },
              ),
              Divider(),
              ListTile(
                leading:
                    Icon(Icons.shopping_cart_outlined, color: Colors.black),
                title: Text('구매내역'),
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.brush_outlined, color: Colors.black),
                title: Text('나의 작품 케어 서비스'),
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.list_alt_outlined, color: Colors.black),
                title: Text('나의 주문'),
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.file_copy_outlined, color: Colors.black),
                title: Text('나의 증명서'),
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.favorite_outline, color: Colors.black),
                title: Text('나의 위시리스트'),
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {},
              ),
              Divider(),
              ListTile(
                leading:
                    Icon(Icons.local_shipping_outlined, color: Colors.black),
                title: Text('배송조회'),
                trailing: Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransportPage(),
                    ),
                  );
                },
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}

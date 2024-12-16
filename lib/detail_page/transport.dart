import 'package:flutter/material.dart';

class TransportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          '藝rism',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '조회',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    _buildStatusItem('확인', true),
                    _buildStatusItem('상품 준비 중', true),
                    _buildStatusItem('배송 준비 중', false),
                    _buildStatusItem('출고 완료', false),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline, color: Colors.black),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '본 제품은 예약 구매로 진행되며, 배송 기간이 약 2주 소요될 수 있습니다. '
                        '제품 예약 기능이 수령 주기가 완료되면 주문이 취소됩니다. '
                        '세부 안내를 참조 바랍니다.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                '나의 주문 내역 (0)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '주문 내역이 없습니다.',
                style: TextStyle(fontSize: 14, color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusItem(String title, bool isActive) {
    return Row(
      children: [
        Column(
          children: [
            Icon(
              Icons.radio_button_checked,
              color: isActive ? Colors.black : Colors.grey,
            ),
            if (title != '출고 완료')
              Container(
                height: 40,
                width: 2,
                color: isActive ? Colors.black : Colors.grey,
              ),
          ],
        ),
        SizedBox(width: 10),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: isActive ? Colors.black : Colors.grey,
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'KhuyenMaiPage.dart';
import 'BanHangPage.dart';
import 'quanly/quanlytrienkhai.dart';
import 'package:get/get.dart';
import 'HomePage.dart';
class QuyTrinhPage extends StatefulWidget {
  final int index;
  QuyTrinhPage({this.index});
  @override
  _QuyTrinhPageState createState() => _QuyTrinhPageState();
}

class _QuyTrinhPageState extends State<QuyTrinhPage> {
  int _index=2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'QUY TRÌNH - BHX',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Nunito',
          ),
        ),
        actions:<Widget> [
          IconButton(
            icon: Icon(Icons.search_sharp,color: Colors.white),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.person,color: Colors.white),
            onPressed: (){},
          ),
        ],
      ),
      bottomNavigationBar: FloatingNavbar(
        backgroundColor: Colors.green,
        selectedItemColor: Colors.black54,
        fontSize: 14.0,
        onTap: (int val) {
          setState(() {
            _index=val;
            if (_index==0)
            {
              Get.to(KhuyenMaiPage());
            }
            if(_index==1)
            {
              Get.to(BanHangPage());
            }
            if(_index==2)
            {
              Get.to(HomePage());
            }
            if(_index==3)
            {
              Get.to(QuanLyTrienKhai());
            }
          });
        },
        currentIndex: _index,
        items: [
          FloatingNavbarItem(icon: Icons.assessment_rounded, title: 'Khuyến mãi'),
          FloatingNavbarItem(icon: Icons.aspect_ratio, title: 'Bán hãng'),
          FloatingNavbarItem(icon: Icons.home, title: 'Triển khai mới'),
          FloatingNavbarItem(icon: Icons.settings, title: 'Quy trình'),
        ],
      ),
    );
  }
}

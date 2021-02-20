import 'package:flutter/material.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:tk_bhx/view/quanly/quanlytrienkhai.dart';
import 'BanHangPage.dart';
import 'KhuyenMaiPage.dart';
import 'HomePage.dart';
import 'QuyTrinhPage.dart';
import 'package:get/get.dart';

class FloatingNavBar extends StatefulWidget {
  @override
  _FloatingNavBarState createState() => _FloatingNavBarState();
}

class _FloatingNavBarState extends State<FloatingNavBar> {
  int _index=2;
  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
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
    );
  }
}

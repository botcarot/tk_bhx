import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:tk_bhx/view/HomePage.dart';
import 'package:tk_bhx/view/KhuyenMaiPage.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:tk_bhx/view/QuyTrinhPage.dart';
import 'BanHangPage.dart';
import 'package:tk_bhx/view/FloatingNavBar.dart';

class BanHang extends StatefulWidget {
  @override
  _BanHangState createState() => _BanHangState();
}

class _BanHangState extends State<BanHang> {
 // int _index=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(),
      appBar: AppBar(
        backgroundColor: Colors.green,
      title: Text(
        'TRIỂN KHAI MỚI - BHX',
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
      body:HomePage(),
    );
  }
}

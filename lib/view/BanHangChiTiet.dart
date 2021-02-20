import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BanHangChiTiet extends StatefulWidget {
  @override
  _BanHangChiTietState createState() => _BanHangChiTietState();
}

class _BanHangChiTietState extends State<BanHangChiTiet> {
  String unilever = Get.arguments[0];
  String nestle = Get.arguments[1];
  String UrlUni='https://static.topcv.vn/company_covers/TwbATRACNCwWa6ZkuI8k.jpg';
  String UrlNestle='https://sciencevietnam.com/wp-content/uploads/2018/12/nestle-vietnam.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết trưng bày',
          style: TextStyle(
            fontFamily: 'Nunito',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text('Siêu thị ${Get.arguments[2]} ${Get.arguments[3]}'),
              SizedBox(
                height: 20,
              ),
              Card(
                child: banhangUnilever(),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: banhangNestle(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget banhangUnilever() {
    if (unilever == '1') {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text("Có trưng bày đầu kệ khô hãng Unilever",
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.network(
            UrlUni,
            height: 400,
            width: 600,
          ),
        ],
      );
    }
    else {
      return Text('Không có hạng mục bán hãng Unilever',
        style: TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
  Widget banhangNestle() {
    if (nestle == '1') {
      return Column(
        children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Text("Có trưng bày đầu kệ khô hãng Nestle",
            style: TextStyle(
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Image.network(
           UrlNestle,
            height: 400,
            width: 600,
          ),
        ],
      );
    }
    else {
      return Text('Không có hạng mục bán hãng Nestle',
        style: TextStyle(
          fontFamily: 'Nunito',
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
}


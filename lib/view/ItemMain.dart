import 'dart:ui';

import 'package:flutter/material.dart';

class ItemMain extends StatefulWidget {
  @override
  _ItemMainState createState() => _ItemMainState();
}

class _ItemMainState extends State<ItemMain> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget> [
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network('https://organicfood.vn/image/cache/catalog/Anhblog/rau-cu-qua-tuoi-1-600x315.jpg'),
          ),
        ),
        Flexible(
          child:
          Column(
            children: <Widget>[
              Text('TRIEN KHAI MOI',
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text('Khu vuc Dong Nai Binh Duong Binh Phuoc Tay Ninh'),
              Text('Thoi gian: 15/01 - 17/01',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'dart:ui';
import 'package:date_field/date_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuanLyTrienKhai extends StatefulWidget {
  final int index;
  QuanLyTrienKhai({this.index});
  @override
  _QuanLyTrienKhaiState createState() => _QuanLyTrienKhaiState();
}

class _QuanLyTrienKhaiState extends State<QuanLyTrienKhai> {
  String tieudetk;
  String noidungtk;
  DateTime thoigiantk;
  String khuvuctk;
  String tepdinhkem;
  String nguoiguitk;
  String nguoilienhe;
  String danhmuctk;
  DateTime selectedDateStar;
  DateTime selectedDateEnd;
  String dropDownValue='Khuyến mãi';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'THÊM TRIỂN KHAI MỚI',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                 labelText: "Tiêu đề triển khai",
                  fillColor: Colors.green,
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nội dung triển khai",
                  fillColor: Colors.green,
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Khu vực áp dụng',
                  fillColor: Colors.green,
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'User liên hệ',
                  fillColor: Colors.green,
                  focusedBorder:OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              DateTimeField(
                  decoration: const InputDecoration(
                      hintText: 'Thời gian bắt đầu'),
                  selectedDate: selectedDateStar,
                  onDateSelected: (DateTime value) {
                    setState(() {
                      selectedDateStar = value;
                    });
                  }),
              SizedBox(
                height: 10,
              ),
              DateTimeField(
                  decoration: const InputDecoration(
                      hintText: 'Thời gian kết thúc'),
                  selectedDate: selectedDateEnd,
                  onDateSelected: (DateTime value) {
                    setState(() {
                      selectedDateEnd = value;
                    });
                  }),
              Text('Danh mục',
                style: TextStyle(
                  fontFamily: 'Nunito',
                ),
              ),
              DropdownButton<String>(
                value: dropDownValue,
                elevation: 16,
                icon: Icon(Icons.arrow_drop_down_circle),
                isExpanded: true,
                items: <String>['Khuyến mãi','Bán hãng','Quy trình','Triển khai khác'].map((e) {
                  return DropdownMenuItem(
                    value: e,
                    child: Text(e) ,
                  );
                }).toList(),
                onChanged: (value){
                   setState(() {
                     dropDownValue=value;
                   });
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text('Thêm hình minh họa',
                style: TextStyle(
                  fontFamily: 'Nunito',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('Thêm tệp đính kèm',
                style: TextStyle(
                  fontFamily: 'Nunito',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

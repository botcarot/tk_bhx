import 'dart:ui';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class DetailPage extends StatefulWidget {
  final int index;
  DetailPage ({this.index});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  String srcimage='https://firebasestorage.googleapis.com/v0/b/tk-bhx.appspot.com/o/Khuy%E1%BA%BFn%20m%C3%A3i%2FMi%E1%BB%81n%20%C4%91%C3%B4ng%2F2201%5C%2FT%E1%BB%94NG%20H%E1%BB%A2P%20GI%C3%81%20S%E1%BB%90C.png?alt=media&token=9dded240-4ad1-471a-b4f1-68630ce5f437flutte';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Chi tiết chương trình',
          style: TextStyle(
            fontFamily: 'Nunito',
          ),
        ),
      ),
      body:  SingleChildScrollView(
        child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('Danh mục: Khuyến mãi',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    Text('TRIỂN KHAI GIÁ SỐC CUỐI TUẦN - CÁ CAM TƯƠI',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Khu vực Miền Tây 2',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text('Thời gian: 22/01 - 24/01',
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                       Image(
                         image: NetworkImage(srcimage),
                       ),
                  ],
                ),
                margin: EdgeInsets.only(top: 30),
               // height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
              ),
      ),
      floatingActionButton: SpeedDial(
        curve: Curves.bounceInOut,
        animatedIcon: AnimatedIcons.list_view,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        animatedIconTheme: IconThemeData.fallback(),
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.share),
            backgroundColor: Colors.green,
            label: 'Chia sẻ',
            onTap: ()=> _shareImageFromUrl(),
          ),
          SpeedDialChild(
            child: Icon(Icons.download_sharp),
            backgroundColor: Colors.green,
            label: 'Tải xuống',
            onTap: ()=> _shareImageFromUrl(),
          ),
        ],
      ),
    );
  }
}
Future<void> _shareImageFromUrl() async {
  try {
    var request = await HttpClient().getUrl(Uri.parse('https://firebasestorage.googleapis.com/v0/b/tk-bhx.appspot.com/o/Khuy%E1%BA%BFn%20m%C3%A3i%2FCTKM%20Mi%E1%BB%81n%20%C4%91%C3%B4ng%202901.png?alt=media&token=6ea574ae-1d9f-4fd0-ae75-0237e6f227b9r'
        ));
    var response = await request.close();
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    await Share.file('ESYS AMLOG', 'amlog.jpg', bytes, 'image/jpg');
  } catch (e) {
    print('error: $e');
  }
}


import 'package:flutter/material.dart';
import 'package:tk_bhx/view/FloatingNavBar.dart';
import 'DetailPage.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'HomePage.dart';
import 'BanHangPage.dart';
import 'quanly/quanlytrienkhai.dart';
class KhuyenMaiPage extends StatefulWidget {
  final int index;
  KhuyenMaiPage ({this.index});
  @override
  _KhuyenMaiPageState createState() => _KhuyenMaiPageState();
}

class _KhuyenMaiPageState extends State<KhuyenMaiPage> {
  int _index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'KHUYẾN MÃI - BHX',
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
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (_,index){
                  return  Container(
                    width: 500,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Image.network('https://firebasestorage.googleapis.com/v0/b/tk-bhx.appspot.com/o/Khuy%E1%BA%BFn%20m%C3%A3i%2FMi%E1%BB%81n%20%C4%91%C3%B4ng%2F2201%5C%2FT%E1%BB%94NG%20H%E1%BB%A2P%20GI%C3%81%20S%E1%BB%90C.png?alt=media&token=9dded240-4ad1-471a-b4f1-68630ce5f437'),
                            title: Text(
                              'TRIỂN KHAI MỚI',
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Nunito',
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  'KHU VỰC HỒ CHÍ MINH',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                                Text(
                                  'Thời gian 15/01 - 17/01',
                                  style: TextStyle(
                                    fontFamily: 'Nunito',
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ButtonTheme(
                            child: ButtonBar(
                              children: <Widget>[
                                FlatButton(
                                  child: const Text(
                                    'Chi tiết',
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  onPressed: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(index: index,)));
                                  },
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
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

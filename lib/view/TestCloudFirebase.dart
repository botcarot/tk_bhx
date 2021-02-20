import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
enum item  {update,delete}

class TestCloudFirebase extends StatefulWidget {
  @override
  _TestCloudFirebaseState createState() => _TestCloudFirebaseState();
}

class _TestCloudFirebaseState extends State<TestCloudFirebase> {
  CollectionReference baby = FirebaseFirestore.instance.collection('baby');
  String name='';
  String votes='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Baby Name Votes',
        ),
      ),
      body: Container(child: Column(
        children: <Widget>[
          Flexible(child: FirebaseData()),
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Nhập name',
          ),
          onChanged: (value){
            value=name;
          },
        ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Nhập votes',
            ),
            onChanged: (value){
              value=votes;
            },
          ),
          SizedBox(
            height: 20,
          ),
        ElevatedButton(
          onPressed: () {
            addbaby();
          },
          child: Text('Add baby'),
        ),
        ],
      )),
      // what context?
    );
  }

  //add documents to cloud firebase
  Future<void> addbaby() async{
    return await baby.add({
      'name':name,
      'votes':votes,
    }).then((value) {
      Get.snackbar('Hoàn thành', 'Thêm mới baby $value');
    }).catchError((error){
      Get.snackbar('Lỗi', '$error');
    });
  }
  //delete data from cloud firebase
  Future<void> deleteBaby(docid) async {
    return await baby.doc(docid).delete().then((value) {
      Get.snackbar('Đã xóa', 'baby thành công');
    }).catchError((error) {
      Get.snackbar('Lỗi', '$error');
    });
  }

  Widget FirebaseData() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('baby').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
                var docid = document.id;
                return Card(
                  child: new ListTile(
                    leading: PopupMenuButton<item>(
                      onSelected: (item result) {
                        if (result == item.delete) {
                          deleteBaby(docid);
                        }
                      },
                      itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<item>>[
                        const PopupMenuItem(child: Text('Update',),
                          value: item.update,
                        ),
                        const PopupMenuItem(child: Text('Delete',),
                          value: item.delete,
                        ),
                      ],
                    ),
                    title: new Text(document['name']),
                    subtitle: new Text(document['votes']),
                    trailing: Text(docid),
                  ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}





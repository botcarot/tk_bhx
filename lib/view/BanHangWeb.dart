import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tk_bhx/view/BanHangChiTiet.dart';

class BanHangWeb extends StatefulWidget {
  @override
  _BanHangWebState createState() => _BanHangWebState();
}

class _BanHangWebState extends State<BanHangWeb> {
  CollectionReference sieuthi=FirebaseFirestore.instance.collection('SieuThi');
  TextEditingController editingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tra cứu bán hãng tại siêu thị',
          style: TextStyle(
            fontFamily: 'Nunito',
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search),
              onPressed: (){
            showSearch(context: context, delegate: ArticleSearch(),
            );
           }
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
        SizedBox(
          height: 30,
        ),
            Flexible(child: FirebaseData()
            ),
          ],
        ),
      ),
    );
  }
  Widget FirebaseData() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('SieuThi').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError)
          return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
               // var docid = document.id;
                return Card(
                  child: ListTile(
                      title:  Text(document.data()['masieuthi'].toString(),
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle:  Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Text(document.data()['tensieuthi'],
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      //trailing: Text(docid),
                    onTap: (){
                      Get.to(BanHangChiTiet(),arguments: [document.data()['unilever'].toString(),document.data()['nestle'].toString(),document.data()['masieuthi'].toString(),document.data()['tensieuthi']]);
                    },
                    ),
                );
              }).toList(),
            );
        }
      },
    );
  }
}
class ArticleSearch extends SearchDelegate< ArticleSearch>{

 @override
  // TODO: implement searchFieldLabel
  String get searchFieldLabel => 'Nhập mã siêu thị';
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return[
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query='';
        },
      )
    ];

  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(icon: Icon(Icons.arrow_back),
        onPressed:(){
         close(context, null);
        },
    );

  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('SieuThi').snapshots(),
      builder: (context,AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData) return Text('Loading...');
        final results =
        snapshot.data.docs.where((a) => a['masieuthi'].toString().contains(query));
        return ListView(
          children: results.map<Widget>((a) =>  Card(
              child: ListTile(
                title:  Text(a['masieuthi'].toString(),
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text(a['tensieuthi'],
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                //trailing: Text(docid),
                onTap: (){
                  Get.to(BanHangChiTiet(),arguments:[ a['unilever'].toString(),a['nestle'].toString(),a['masieuthi'].toString(), a['tensieuthi']]);
                },
              ),
          ),
          )
              .toList(),
        );
      },
    );
  }
  
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tk_bhx/services/Database.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  DatabaseService databaseService=DatabaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Đăng Nhập',
          style: TextStyle(
            fontFamily: 'Nunito',
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Email',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent),
                ),
              ),
              onTap: (){

              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Password',
                fillColor: Colors.white,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              shape: StadiumBorder(
                side: BorderSide(color: Colors.white, width: 2),
              ),
              onPressed: () {
                databaseService.addUsers();
              },
              child: const Text('Đăng nhập',
              style: TextStyle(
                fontFamily: 'Nunito',
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tk_bhx/view/BanHangWeb.dart';
import 'package:tk_bhx/view/HomePage.dart';
import 'package:tk_bhx/view/TestCloudFirebase.dart';
import 'package:tk_bhx/view/TestUploadImage.dart';
import 'package:tk_bhx/view/auth/LogIn.dart';
import 'package:tk_bhx/view/home.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Nunito',
      ),
      home:BanHangWeb(),
      );
  }
}


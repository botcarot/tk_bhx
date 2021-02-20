
import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseService{
  final CollectionReference userCollection = FirebaseFirestore.instance.collection('user');

  Future<void> addUsers() async{
    return await userCollection.add({
      'msnv':'2',
      'matkhau':'abc',
    });
  }
  }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/update_data.dart';

import 'add_data.dart';


CollectionReference firestore = FirebaseFirestore.instance.collection("student");

class FirebaseDatabaseClass {
  static Future<void> addData({String? name, String? address, String? rollno, String? age}) async {
    DocumentReference documentReference = firestore.doc();
    Map<String, dynamic> data = {"name":s_name.text,"address":s_address.text,"rollno":s_rollno.text,"age":s_age.text };

    await documentReference
        .set(data)
        .whenComplete(() => print("item added to the database"))
        .catchError((e) => print(e));
  }

  static Future<void> upedetdata(
      {String? name,String? address,String? rollno,String? age ,required String id}) async {
    DocumentReference document = firestore.doc(id);

    Map<String, dynamic> data = {
      "name": controller1.text,
      "address": controller2.text,
      "rollno": controller3.text,
      "age": controller4.text,
    };
    await document.update(data);
  }

  static Future<void> updateStatus({
    required bool status,
    required String id,
  }) async {
    DocumentReference documentReference = firestore.doc(id);
    Map<String, dynamic> data = <String, dynamic>{
      "complete": status,
    };

    await documentReference
        .update(data)
        .whenComplete(() => print("item updated in the database"))
        .catchError((e) => print(e));
  }

  static Future<void> deleteData({
    required String id,
  }) async {
    DocumentReference documentReference = firestore.doc(id);
    await documentReference
        .delete()
        .whenComplete(() => print('item deleted from the database'))
        .catchError((e) => print(e));
  }
}


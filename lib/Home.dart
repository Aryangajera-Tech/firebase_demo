import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_demo/add_data.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'database.dart';
import 'update_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

final CollectionReference firestore = FirebaseFirestore.instance.collection("student");

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Center(child: Text('Student',style: TextStyle(fontSize: 30,color: Colors.black),)),
      ),
      body: Container(
        child: StreamBuilder(
          stream: firestore.snapshots(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Text('Data not available');
            } else if (snapshot.hasError) {
              return const Text('Error occurred');
            } else if (snapshot.hasData) {
              {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final DocumentSnapshot data = snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(color: Colors.lightGreen, width: 3),
                        ),
                        child: ListTile(
                            leading: Text('${index + 1}',
                                style:
                                TextStyle(fontSize: 30, color: Colors.black87)),
                          title: Text(
                            data["name"].toString(),
                            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          trailing: Container(
                            width: w * 0.20,
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.black87,size: 30,
                                  ),
                                  onTap: () async {
                                    controller1.clear();
                                    controller2.clear();
                                    controller3.clear();
                                    controller4.clear();
                                    Navigator.push(context,MaterialPageRoute(builder: (context) =>UpdateNotePage(id: data.id)));
                                  },
                                ),
                                InkWell(
                                  onTap: () async {
                                    AwesomeDialog(
                                        context: context,
                                        title: "Warning",
                                        body: const Text(
                                            "Are you sure you want to delete the data?"),
                                        dialogType: DialogType.WARNING,
                                        animType: AnimType.BOTTOMSLIDE,
                                        btnCancelOnPress: () {
                                          //Navigator.of(context).pop();
                                        },
                                        btnOkOnPress: () async {
                                          await FirebaseDatabaseClass
                                              .deleteData(id: data.id);
                                          Fluttertoast.showToast(
                                              msg: "Data Is delete",
                                              fontSize: 18,
                                              backgroundColor:
                                              Colors.lightGreen);
                                          //Navigator.of(context).pop();
                                        }).show();
                                  },
                                  child: const Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => add()),
          );
          setState(() {
            s_name.clear();
            s_address.clear();
            s_age.clear();
            s_rollno.clear();
          });
        },
        elevation: 10.0,
        backgroundColor: Colors.lightGreen,
        child: const Icon(Icons.add,color: Colors.black87,size: 30,),
      ),

    );
  }
}

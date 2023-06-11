import 'package:flutter/material.dart';

import 'add_data.dart';
import 'database.dart';


TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();
TextEditingController controller3 = TextEditingController();
TextEditingController controller4 = TextEditingController();

class UpdateNotePage extends StatefulWidget {
  String id;
  UpdateNotePage({Key? key, required this.id}) : super(key: key);
  @override
  _UpdateNotePageState createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
  @override
  Widget build(BuildContext context) {

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              children: [
                TextField(
                  controller: controller1,
                  cursorColor: Colors.lightGreen,
                  decoration: InputDecoration(
                    hintText: "update your name",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.green,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller2,
                  cursorColor: Colors.lightGreen,
                  decoration: InputDecoration(
                    hintText: "update your address",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.black,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller3,
                  cursorColor: Colors.lightGreen,
                  decoration: InputDecoration(
                    hintText: "update your rollno",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.green,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: controller4,
                  cursorColor: Colors.lightGreen,
                  decoration: InputDecoration(
                    hintText: "update your age",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.green,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.lightGreen,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: w / 2.3,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightGreen,
                          ),
                          child: Center(
                              child: Text(
                                "Cancle",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          FirebaseDatabaseClass.upedetdata(
                            name: controller1.text,
                            address: controller2.text,
                            rollno: controller3.text,
                            age: controller4.text,
                            id: widget.id,
                          );
                          setState(() {});
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: w / 2.3,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightGreen,
                          ),
                          child: Center(
                              child: Text(
                                "Update",
                                style: TextStyle(fontSize: 20),
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


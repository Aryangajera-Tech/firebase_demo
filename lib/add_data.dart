import 'package:flutter/material.dart';
import 'database.dart';

TextEditingController s_name = TextEditingController();
TextEditingController s_address = TextEditingController();
TextEditingController s_rollno = TextEditingController();
TextEditingController s_age = TextEditingController();

class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  @override
  Widget build(BuildContext context) {

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text("Add Data",style: TextStyle(fontSize: 25,color: Colors.black),),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: s_name,
                  cursorColor: Colors.lightGreen,
                  decoration: InputDecoration(
                    hintText: "Add your name",
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
                  controller: s_address,
                  cursorColor: Colors.lightGreen,
                  decoration: InputDecoration(
                    hintText: "Add your address",
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
                  controller: s_rollno,
                  cursorColor: Colors.lightGreen,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Add your rollno",
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
                  controller: s_age,
                  cursorColor: Colors.lightGreen,
                  keyboardType:TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Add your age",
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
                                style: TextStyle(fontSize: 22,color: Colors.black,),
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          FirebaseDatabaseClass.addData();
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
                                "Save",
                                style: TextStyle(fontSize: 22,color: Colors.black),
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

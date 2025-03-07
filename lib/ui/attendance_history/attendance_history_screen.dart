import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({
    super.key
  });

  @override
  State < AttendanceHistoryScreen > createState() =>
    _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State < AttendanceHistoryScreen > {
  final CollectionReference dataCollection =
  FirebaseFirestore.instance.collection('sttendence');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(

        backgroundColor: const Color.fromARGB(130, 68, 255, 118),
          elevation: 5,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Color.fromARGB(255, 0, 127, 34)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text("Attendance History",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 127, 34))),
      ),
      body: FutureBuilder < QuerySnapshot > (
        future: dataCollection.get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data!.docs;
            return data.isNotEmpty ?
              ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.primaries[Random()
                              .nextInt(Colors.primaries.length)],
                            borderRadius: BorderRadius.circular(50)),
                          child: Center(
                            child: Text(
                              (data.isNotEmpty && data[index]['name'] != null) ?
                              data[index]['name'][0].toUpperCase() :
                              '-',
                              style: TextStyle(
                                color: Colors.white, fontSize: 14),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      'name',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                    )),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      ':',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                    )),
                                  Expanded(
                                    child: Text(
                                      data[index]['name'],
                                      style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    ))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      'address',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                    )),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      ':',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                    )),
                                  Expanded(
                                    child: Text(
                                      data[index]['address'],
                                      style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    ))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      'status',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                    )),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      ':',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                    )),
                                  Expanded(
                                    child: Text(
                                      data[index]['status'],
                                      style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    ))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      'dateTime',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                    )),
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      ':',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14),
                                    )),
                                  Expanded(
                                    child: Text(
                                      data[index]['dateTime'],
                                      style: TextStyle(
                                        color: Colors.black, fontSize: 14),
                                    ))
                                ],
                              )
                            ],
                          ))
                      ],
                    ),
                  );
                }) :
              const Center(
                child: Text(
                  "Ups, data not found!",
                  style: TextStyle(fontSize: 20),
                ),
              );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation < Color > (Colors.blueAccent),
              ),
            );
          }
        }),
    );
  }
}
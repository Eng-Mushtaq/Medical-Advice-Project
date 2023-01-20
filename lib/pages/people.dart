import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/model/doctor_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DoctorsChat extends StatefulWidget {
  @override
  State<DoctorsChat> createState() => _DoctorsChatState();
}

class _DoctorsChatState extends State<DoctorsChat> {
  var currentUser = FirebaseAuth.instance.currentUser?.uid;
  List<Doctor> list = [];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('Doctors')
          // .where('uid', isNotEqualTo: currentUser)
          .snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
          case ConnectionState.none:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.active:
          case ConnectionState.done:
            final data = snapshot.data!.docs;
            list = data.map((e) => Doctor.fromJson(e.data())).toList();
        }
        if (list.isNotEmpty) {
          return ListView.builder(
            itemCount: list.length,
            padding: EdgeInsets.only(top: 15),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(list[index].name.toString()),
                subtitle: Text(list[index].special.toString()),
              );
            },
          );
        }
        
        else
        {return Center(
          child: Text('no data foud'),
        );}
      },
    );
  }
}

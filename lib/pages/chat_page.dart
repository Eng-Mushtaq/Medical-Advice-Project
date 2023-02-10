import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:doctor_app/theme/colors.dart';
import 'package:doctor_app/widgets/avatar_image.dart';
import 'package:doctor_app/widgets/chat_item.dart';
import 'package:doctor_app/widgets/textbox.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/doctor_model.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  var currentUser = FirebaseAuth.instance.currentUser?.uid;
  List<Doctor> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appBgColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("غرفة المحادثات",
              style: titleText.copyWith(
                  color: Colors.black, fontWeight: FontWeight.bold)
              //  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(
                Icons.more_vert_outlined,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Doctors')
              .where('userId', isNotEqualTo: currentUser)
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
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextBox(),
                        SizedBox(
                          height: 20,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              list.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Badge(
                                    badgeColor: Colors.green,
                                    borderSide: BorderSide(color: Colors.white),
                                    position:
                                        BadgePosition.topEnd(top: -3, end: 0),
                                    badgeContent: Text(''),
                                    child: AvatarImage(
                                        list[index].image.toString())),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        getChatList(list)
                      ]),
                ),
              );        
            } else {
              return Center(
                child: Text('لا يوجد  بيانات !'),
              );
            }
          },
        ),
       

        );
  }



  getChatList(List<Doctor> users) {
    return Column(
        children:
            List.generate(users.length, (index) => ChatItem(users[index])));
  }
}

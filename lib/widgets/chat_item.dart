import 'package:doctor_app/pages/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/doctor_model.dart';
import 'avatar_image.dart';

class ChatItem extends StatelessWidget {
  const ChatItem(
    this.chatData, {
    Key? key,
  }) : super(key: key);
  final Doctor chatData;
  // final GestureTapCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ChatScreen(user: chatData));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvatarImage(
                  chatData.image.toString(),
                  radius: 10,
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Container(
                        height: MediaQuery.of(context).size.height * 0.095,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              children: <Widget>[
                                Expanded(
                                    child: Container(
                                        child: Text(chatData.name.toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700)))),
                                SizedBox(width: 5),
                                Container(
                                    child: Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 10,
                                  color: Colors.grey,
                                )),
                                SizedBox(width: 3),
                                Container(
                                    child: Text(chatData. createdAt.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 11, color: Colors.grey)))
                              ],
                            ),
                       
                            Row(
                              children: <Widget>[
                                Container(
                                    child: Text(chatData.special.toString(),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.grey))),
                              ],
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              chatData.qualification.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

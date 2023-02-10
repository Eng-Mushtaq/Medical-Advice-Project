import 'package:doctor_app/api/apis.dart';
import 'package:doctor_app/helper/convertDate.dart';
import 'package:doctor_app/pages/succes_booking_page.dart';
import 'package:doctor_app/theme/colors.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:table_calendar/table_calendar.dart';

import '../model/doctor_model.dart';
import '../widgets/mybutton.dart';

class BookingScreen extends StatefulWidget {
  BookingScreen({super.key, this.doctor});
  Doctor? doctor;
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  CalendarFormat _format = CalendarFormat.month;
  DateTime _focusDay = DateTime.now();
  DateTime _currentDay = DateTime.now();
  int? _currentIndex;
  bool? _isWeekend = false;
  bool? _dateSelected = false;
  bool? _timeSelected = false;

  @override
  Widget build(BuildContext context) {
    Config();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "حجز موعد ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                _tableCalender(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 25,
                  ),
                )
              ],
            ),
          ),
          _isWeekend!
              ? SliverToBoxAdapter(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 30,
                    ),
                    alignment: Alignment.center,
                    child: Text('end of week'),
                  ),
                )
              : SliverGrid(
                  delegate: SliverChildBuilderDelegate(((context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                          _timeSelected = true;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: _currentIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(15),
                            color: _currentIndex == index ? primary : null),
                        alignment: Alignment.center,
                        child: Text(
                          '${index + 9}:00 ${index + 9 > 11 ? 'PM' : 'AM'}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _currentIndex == index ? Colors.white : null,
                          ),
                        ),
                      ),
                    );
                  }), childCount: 8),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 2,
                  ),
                ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 80,
              ),
              child: MyButton(
                disableButton: _timeSelected! && _dateSelected! ? false : true,
                bgColor: primary,
                title: 'تأكيد الحجز',

                // title: "Request For Appointment",
                onTap: () {
                  final getDate = DateConverted.getDate(_currentDay);
                  final getDay = DateConverted.getDay(_currentDay.weekday);
                  final getTime = DateConverted.getTime(_currentIndex!);
                  APIs.makeAppointment(
                  docId:   widget.doctor!.userId!,
                  doctor_name: widget.doctor!.name ,
                  doctor_profile:  widget.doctor!.image,
                  patId:   FirebaseAuth.instance.currentUser!.uid,
                   date:  getDate,
                    day:  getDay,
                   time:  getTime,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _tableCalender() {
    return TableCalendar(
      // selectedDayPredicate: (_focusDay) {
      //   return true;
      // },
      focusedDay: _focusDay,
      firstDay: DateTime.now(),
      lastDay: DateTime(2024, 04, 8),
      calendarFormat: _format,
      currentDay: _currentDay,
      rowHeight: 48,
      calendarStyle: CalendarStyle(
          todayDecoration:
              BoxDecoration(color: primary, shape: BoxShape.circle)),
      availableCalendarFormats: const {
        CalendarFormat.month: 'month',
      },
      onFormatChanged: (format) {
        setState(() {
          _format = format;
        });
      },
      onDaySelected: ((selectedDay, focusedDay) {
        setState(() {
          _currentDay = selectedDay;
          _focusDay = focusedDay;
          _dateSelected = true;
          if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
            _isWeekend = true;
            _timeSelected = false;
            _currentIndex = null;
          } else {
            _isWeekend = false;
          }
        });
      }),
    );
  }
}

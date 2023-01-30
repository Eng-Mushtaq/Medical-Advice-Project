// import 'package:doctor_app/theme/colors.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';
// import 'package:table_calendar/table_calendar.dart';

// class BookingPage extends StatefulWidget {
//   const BookingPage({super.key});

//   @override
//   State<BookingPage> createState() => _BookingPageState();
// }

// class _BookingPageState extends State<BookingPage> {
//   CalendarFormat _format = CalendarFormat.month;
//   DateTime _focusDay = DateTime.now();
//   DateTime _currentDay = DateTime.now();
//   int? _currentIndex;
//   bool? _isWeekend = false;
//   bool? _dateSelected = false;
//   bool? _timeSelected = false;

//   @override
//   Widget build(BuildContext context) {
//     Config();
//     return Scaffold(
//       appBar: AppBar(),
//       body: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: Column(
//               children: [
//                 _tableCalender(),
//                 Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 10,
//                     vertical: 25,
//                   ),
//                 )
//               ],
//             ),
//           ),
//           _isWeekend!
//               ? SliverToBoxAdapter(
//                   child: Container(
//                     padding: EdgeInsets.symmetric(
//                       horizontal: 10,
//                       vertical: 30,
//                     ),
//                     alignment: Alignment.center,
//                     child: Text('end of week'),
//                   ),
//                 )
//               : SliverGrid(
//                   delegate: SliverChildBuilderDelegate(((context, index) {
//                     return InkWell(
//                       splashColor: Colors.transparent,
//                       onTap: () {
//                         setState(() {
//                           _currentIndex = index;
//                           _timeSelected = true;
//                         });
//                       },
//                       child: Container(
//                         margin: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                               color: _currentIndex == index
//                                   ? Colors.white
//                                   : Colors.black,
//                             ),
//                             borderRadius: BorderRadius.circular(15),
//                             color: _currentIndex == index ? primary : null),
//                         alignment: Alignment.center,
//                         child: Text(
//                           '${index + 9}:00 ${index + 9 > 11 ? 'PM' : 'AM'}',
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: _currentIndex == index ? Colors.white : null,
//                           ),
//                         ),
//                       ),
//                     );
//                   }), childCount: 8),
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 4,
//                     childAspectRatio: 2,
//                   ),
//                 ),
//           SliverToBoxAdapter(
//             child: Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: 10,
//                 vertical: 80,
//               ),
//               child: ElevatedButton(
//                 child: Text('make appointment'),
//                 onPressed: () {},
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _tableCalender() {
//     return TableCalendar(
//       selectedDayPredicate: (_focusDay) {
//         return true;
//       },
//       focusedDay: _focusDay,
//       firstDay: DateTime.now(),
//       lastDay: DateTime(2023, 01, 26),
//       calendarFormat: _format,
//       currentDay: _currentDay,
//       rowHeight: 48,
//       calendarStyle: CalendarStyle(
//           todayDecoration:
//               BoxDecoration(color: primary, shape: BoxShape.circle)),
//       availableCalendarFormats: const {
//         CalendarFormat.month: 'month',
//       },
//       onFormatChanged: (format) {
//         setState(() {
//           _format = format;
//         });
//       },
//       onDaySelected: ((selectedDay, focusedDay) {
//         setState(() {
//           _currentDay = selectedDay;
//           _focusDay = focusedDay;
//           _dateSelected = true;
//           if (selectedDay.weekday == 6 || selectedDay.weekday == 7) {
//             _isWeekend = false;
//             _timeSelected = true;
//             _currentIndex = null;
//           } else {
//             _isWeekend = true;
//           }
//         });
//       }),
//     );
//   }
// }

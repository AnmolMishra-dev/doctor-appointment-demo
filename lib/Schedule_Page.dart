import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Booked_page.dart';
import 'const.dart';

class Schedule extends StatefulWidget {
  const Schedule({Key? key}) : super(key: key);

  @override
  _ScheduleState createState() => _ScheduleState();
}

class _ScheduleState extends State<Schedule> {

  DateTime now = DateTime.now();
  String _currentHour = DateTime.now().hour.toString();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String time = "19.00 AM";



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Schedule",
          style: TextStyle(
              color: AppColors.Text_Black,
              fontWeight: FontWeight.w500,
              fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: AppColors.Text_white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: AppColors.Text_Black,
            size: 25,
          ),
        ),
      ),
      body: SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Card(
                  elevation: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TableCalendar(
                      locale: 'en_US',
                      onDaySelected: (selectedDay, focusedDay) {
                        if (!isSameDay(_selectedDay, selectedDay)) {
                          // Call `setState()` when updating the selected day
                          setState(() {
                            _selectedDay = selectedDay;
                            _focusedDay = focusedDay;
                            print(_selectedDay);
                          });
                        }
                      },
                      onFormatChanged: (format) {
                        if (_calendarFormat != format) {
                          // Call `setState()` when updating calendar format
                          setState(() {
                            _calendarFormat = format;
                          });
                        }
                      },
                      onPageChanged: (focusedDay) {
                        // No need to call `setState()` here
                        _focusedDay = focusedDay;
                      },
                      formatAnimationDuration: Duration(milliseconds: 2000),
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month',
                      },
                      firstDay: DateTime.now(),
                      lastDay: DateTime.utc(2050, 3, 14),
                      focusedDay: _focusedDay,
                      calendarFormat: _calendarFormat,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDay, day);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "Choose Schedule",
                    style: TextStyle(
                        color: AppColors.Text_Black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {});
                            },
                            child: Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                    color:AppColors.Home_Color1_Gra,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  time,
                                  style: TextStyle(
                                      color: AppColors.Text_white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ))),
                          ),
                          Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "10.00 AM",
                                style: TextStyle(
                                    color: AppColors.Text_Black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ))),
                          Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "01.00 PM",
                                style: TextStyle(
                                    color: AppColors.Text_Black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ))),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "09.00 AM",
                                style: TextStyle(
                                    color: AppColors.Text_white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ))),
                          Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "11.00 AM",
                                style: TextStyle(
                                    color: AppColors.Text_Black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ))),
                          Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                  child: Text(
                                "02.00 PM",
                                style: TextStyle(
                                    color: AppColors.Text_Black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ))),
                        ],
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Booked()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Container(
                      child: Center(
                          child: Text(
                        "Book Appointment",
                        style: TextStyle(
                            color: AppColors.Text_white,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      )),
                      height: 60,
                      width: MediaQuery.of(context).size.width * .7,
                      decoration: BoxDecoration(
                          color: AppColors.Home_Color1_Gra,
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_skyline/constants.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'DrawerWidget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool start = false;
  bool breakTime = false;
  bool stop = false;
  String displyTime = '00:00:00';

  final dur = Duration(seconds: 1);

  var swatch = Stopwatch();

  void startstopwatch() {
    setState(() {
      start = true;
      stop = true;
      breakTime = true;
    });
    swatch.start();
    startTime();
  }

  void stopstopwatch() {
    setState(() {
      stop = false;
      start = false;
    });
    swatch.reset();
    swatch.stop();
  }

  void breakstopwatch() {
    setState(() {
      if (breakTime == true) {
        swatch.stop();
        setState(() {
          breakTime = false;
        });
      } else {
        swatch.start();
        startTime();
        setState(() {
          breakTime = true;
        });
      }
    });
  }

  void startTime() {
    Timer(dur, keeprunning);
  }

  void keeprunning() {
    if (swatch.isRunning) {
      startTime();
    }
    setState(() {
      displyTime = swatch.elapsed.inHours.toString().padLeft(2, '0') +
          ':' +
          (swatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
          ':' +
          (swatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAccentLightColor,
        title: Text(
          'Skyline Infosys',
          style: GoogleFonts.merriweather(
            color: Colors.black.withOpacity(0.4),
          ),
        ),
      ),
      drawer: DrawerWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'Dashboard',
                style: GoogleFonts.merriweather(fontSize: 35),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(15),
                color: Colors.grey.withOpacity(0.2),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 10),
                    Text(
                      'Home',
                      style: GoogleFonts.merriweather(fontSize: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  displyTime,
                  style: GoogleFonts.merriweather(fontSize: 80),
                ),
              ),
              SizedBox(height: 20),
              start
                  ? Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: breakstopwatch,
                            child: Center(
                              child: Container(
                                alignment: Alignment.center,
                                width: 230,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey.withOpacity(0.2)),
                                child: Text(
                                  'Break',
                                  style: GoogleFonts.merriweather(
                                    color: Colors.black.withOpacity(0.4),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          InkWell(
                            onTap: stop ? stopstopwatch : null,
                            child: Center(
                              child: Container(
                                alignment: Alignment.center,
                                width: 230,
                                height: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.red.withOpacity(0.2)),
                                child: Text(
                                  'Punch out',
                                  style: GoogleFonts.merriweather(
                                    color: Colors.black.withOpacity(0.4),
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: start ? null : startstopwatch,
                      child: Center(
                        child: Container(
                          alignment: Alignment.center,
                          width: 480,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kAccentLightColor),
                          child: Text(
                            'Punch in',
                            style: GoogleFonts.merriweather(
                              color: Colors.black.withOpacity(0.4),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 20),
              Text(
                'Calendar',
                style: GoogleFonts.merriweather(fontSize: 30),
              ),
              Container(
                height: 1000,
                child: SfCalendar(
                  view: CalendarView.month,
                  dataSource: MeetingDataSource(_getDataSource()),
                  showNavigationArrow: true,
                  showDatePickerButton: true,
                  showCurrentTimeIndicator: true,
                  allowViewNavigation: true,
                  monthViewSettings: MonthViewSettings(
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.appointment,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                '2021 © Samay - The Complete Office Automation System',
                style: GoogleFonts.merriweather(),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day);
    final DateTime endTime = startTime.add(const Duration(minutes: 1));
    meetings.add(
      Meeting('Some One Leave', startTime, endTime, Color(0xFF0F8644), true),
    );
    log(meetings[0].eventName.toString());
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}

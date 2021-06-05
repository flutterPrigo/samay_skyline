import 'dart:html';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'DrawerWidget.dart';
import 'constants.dart';

class AppliedLeave extends StatefulWidget {
  const AppliedLeave({Key? key}) : super(key: key);

  @override
  _AppliedLeaveState createState() => _AppliedLeaveState();
}

class _AppliedLeaveState extends State<AppliedLeave> {
  leaveType _leave = leaveType.fullday;

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
                'Leave',
                style: GoogleFonts.merriweather(fontSize: 35),
              ),
              SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(15),
                color: Colors.grey.withOpacity(0.2),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 10),
                    Text(
                      'Home',
                      style: GoogleFonts.merriweather(fontSize: 25),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward_ios),
                    SizedBox(width: 10),
                    Text(
                      'Leave',
                      style: GoogleFonts.merriweather(fontSize: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 500,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.green,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      color: Colors.green,
                      padding: EdgeInsets.only(bottom: 10, top: 10, left: 10),
                      child: Row(
                        children: [
                          Icon(
                            Icons.view_headline_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Apply Leave',
                            style:
                            GoogleFonts.merriweather(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Reason:',
                            style: GoogleFonts.merriweather(fontSize: 19),
                          ),
                          Text(
                            '*',
                            style: GoogleFonts.merriweather(color: Colors.red),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.20,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                fillColor: Colors.grey,
                                focusColor: Colors.grey,
                                hoverColor: Colors.grey,
                              ),
                              cursorColor: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Date Range:',
                            style: GoogleFonts.merriweather(fontSize: 19),
                          ),
                          Text(
                            '*',
                            style: GoogleFonts.merriweather(color: Colors.red),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.20,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                fillColor: Colors.grey,
                                focusColor: Colors.grey,
                                hoverColor: Colors.grey,
                              ),
                              cursorColor: Colors.grey,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            'to',
                            style: GoogleFonts.merriweather(),
                          ),
                          SizedBox(width: 10),
                          Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.20,
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                fillColor: Colors.grey,
                                focusColor: Colors.grey,
                                hoverColor: Colors.grey,
                              ),
                              cursorColor: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text(
                            'Leave Type:',
                            style: GoogleFonts.merriweather(fontSize: 19),
                          ),
                          Text(
                            '*',
                            style: GoogleFonts.merriweather(color: Colors.red),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                    value: leaveType.fullday,
                                    groupValue: _leave,
                                    onChanged: (value) {
                                      setState(() {
                                        _leave = leaveType.fullday;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Full day',
                                    style: GoogleFonts.merriweather(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '10AM to 7PM',
                                    style: GoogleFonts.merriweather(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: leaveType.firstHalf,
                                    groupValue: _leave,
                                    onChanged: (val) {
                                      setState(() {
                                        _leave = leaveType.firstHalf;
                                      });
                                    },
                                  ),
                                  Text(
                                    'First Half',
                                    style: GoogleFonts.merriweather(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '7PM to 2PM',
                                    style: GoogleFonts.merriweather(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                    value: leaveType.secondHalf,
                                    groupValue: _leave,
                                    onChanged: (val) {
                                      setState(() {
                                        _leave = leaveType.secondHalf;
                                      });
                                    },
                                  ),
                                  Text(
                                    'Second Half',
                                    style: GoogleFonts.merriweather(
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '3PM to 7PM',
                                    style: GoogleFonts.merriweather(
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Note: For half-day, you have to maintain 4 hours for that day.',
                                style: GoogleFonts.merriweather(
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 50),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(left: 20),
                        width: 250,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kAccentLightColor),
                        child: Text(
                          'Submit',
                          style: GoogleFonts.merriweather(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum leaveType { fullday, firstHalf, secondHalf }

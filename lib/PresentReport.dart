import 'dart:developer';
import 'dart:io';

import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_skyline/Data/data.dart';
import 'package:samay_skyline/class/User.dart';

import 'DrawerWidget.dart';
import 'constants.dart';

class PresentReport extends StatefulWidget {
  const PresentReport({Key? key}) : super(key: key);

  @override
  _PresentReportState createState() => _PresentReportState();
}

class _PresentReportState extends State<PresentReport> {
  late List<User> users;
  int? sortColumnIndex;
  bool isAscending = false;

  @override
  void initState() {
    super.initState();

    this.users = List.of(allUsers);
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
                'Present Report',
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
                    SizedBox(width: 10),
                    Icon(Icons.arrow_forward_ios),
                    SizedBox(width: 10),
                    Text(
                      'Present Report',
                      style: GoogleFonts.merriweather(fontSize: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              buildDataTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDataTable() {
    final columns = [
      'Employee Name',
      'Date',
      'In Time',
      'Out Time',
      'Total Time',
      'IP Address',
      'Browser',
      'Device'
    ];

    return DataTable(
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
            onSort: onSort,
          ))
      .toList();

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [
          user.emplyeeName,
          user.date,
          user.inTime,
          user.outTime,
          user.totalTime,
          user.ipAdress,
          user.browser,
          user.device,
        ];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  void onSort(int columnIndex, bool   ascending) {
    if (columnIndex == 0) {
      users.sort((user1, user2) =>
          compareString(ascending, user1.emplyeeName, user2.emplyeeName));
    } else if (columnIndex == 1) {
      users.sort(
          (user1, user2) => compareString(ascending, user1.date, user2.date));
    } else if (columnIndex == 2) {
      users.sort((user1, user2) =>
          compareString(ascending, '${user1.inTime}', '${user2.inTime}'));
    }

    setState(() {
      this.sortColumnIndex = columnIndex;
      this.isAscending = ascending;
    });
  }

  int compareString(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}

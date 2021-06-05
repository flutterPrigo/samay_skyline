import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_skyline/class/Holiday.dart';
import 'package:samay_skyline/constants.dart';
import 'package:samay_skyline/Data/data.dart';

import 'DrawerWidget.dart';

class HolidayLeave extends StatefulWidget {
  const HolidayLeave({Key? key}) : super(key: key);

  @override
  _HolidayLeaveState createState() => _HolidayLeaveState();
}

class _HolidayLeaveState extends State<HolidayLeave> {
  late List<Holiday> holidayss;

  @override
  void initState() {
    super.initState();

    this.holidayss = List.of(allHoliday);
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
                'Holiday',
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
                      'Holiday',
                      style: GoogleFonts.merriweather(fontSize: 25),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
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
                      'Holiday List',
                      style: GoogleFonts.merriweather(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Year : ${DateTime.now().year.toString()}",
                  style: GoogleFonts.merriweather(fontSize: 20),
                ),
              ),
              buildHolidayTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHolidayTable() {
    final columns = [
      'Name',
      'Date',
      'Day',
      'Action',
    ];
    return DataTable(
      columns: getColumns(columns),
      rows: getRows(holidayss),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  List<DataRow> getRows(List<Holiday> users) => users.map((Holiday holiday) {
        final cells = [holiday.name, holiday.date, holiday.day, holiday.action];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();
}

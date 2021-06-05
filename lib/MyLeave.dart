import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_skyline/DrawerWidget.dart';
import 'package:samay_skyline/class/Leave.dart';
import 'package:samay_skyline/constants.dart';
import 'package:samay_skyline/Data/data.dart';

class MyLeave extends StatefulWidget {
  const MyLeave({Key? key}) : super(key: key);

  @override
  _MyLeaveState createState() => _MyLeaveState();
}

class _MyLeaveState extends State<MyLeave> {
  late List<Leave> leaves;

  @override
  void initState() {
    super.initState();

    this.leaves = List.of(allLeave);
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
                'My Leave',
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
                      'Leave List',
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
                      'Leave List',
                      style: GoogleFonts.merriweather(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              buildleavetable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildleavetable() {
    final columns = [
      'Reason',
      'Working On',
      'Leave Type',
      'Leave From',
      'Leave To',
      'Status',
      'Action',
    ];
    return DataTable(

      columns: getColumns(columns),
      rows: getRows(leaves),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  List<DataRow> getRows(List<Leave> users) => users.map((Leave leave) {
        final cells = [
          leave.reason,
          leave.workingon,
          leave.leavetype,
          leave.leavefrom,
          leave.leaveto,
          leave.status,
          leave.action,
        ];

        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();
}

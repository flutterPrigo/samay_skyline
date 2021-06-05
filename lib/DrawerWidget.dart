import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_skyline/AppliedLeave.dart';
import 'package:samay_skyline/Dashboard.dart';
import 'package:samay_skyline/Holiday.dart';
import 'package:samay_skyline/MyLeave.dart';

import 'PresentReport.dart';
import 'constants.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: CircleAvatar(
              backgroundColor: kAccentLightColor.withOpacity(0.2),
              radius: 50,
              child: Icon(
                Icons.person,
                color: kAccentLightColor,
                size: 100,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: kAccentLightColor),
            title: Text('Dashboard'),
            trailing: Icon(Icons.arrow_forward_ios, color: kAccentLightColor),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return Dashboard();
                  },
                ),
              );
            },
          ),
          Divider(color: kAccentLightColor),
          ListTile(
            leading: Icon(Icons.calendar_today, color: kAccentLightColor),
            title: Text('Present Report'),
            trailing: Icon(Icons.arrow_forward_ios, color: kAccentLightColor),
            onTap: () {
              Navigator.pop(context);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return PresentReport();
                  },
                ),
              );
            },
          ),
          Divider(color: kAccentLightColor),
          ExpansionTile(
            title: Text(
              'Leave',
              style: GoogleFonts.merriweather(color: kAccentLightColor),
            ),
            trailing: Icon(Icons.arrow_forward_ios, color: kAccentLightColor),
            leading: Icon(Icons.leave_bags_at_home, color: kAccentLightColor),
            expandedAlignment: Alignment.centerLeft,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return AppliedLeave();
                        },
                      ),
                    );
                  },
                  child: Text('Applied Leave'),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return MyLeave();
                        },
                      ),
                    );
                  },
                  child: Text('My Leave'),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
          Divider(color: kAccentLightColor),
          ListTile(
            leading:
                Icon(Icons.bookmark_outline_sharp, color: kAccentLightColor),
            title: Text('Holiday'),
            trailing: Icon(Icons.arrow_forward_ios, color: kAccentLightColor),
            onTap: () {
              Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return HolidayLeave();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

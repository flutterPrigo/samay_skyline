import 'dart:developer';
import 'dart:io' ;

import 'package:dart_ipify/dart_ipify.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:samay_skyline/Clock.dart';
import 'package:samay_skyline/theme.dart';
import 'package:web_browser_detect/web_browser_detect.dart';

import 'Dashboard.dart';
import 'constants.dart';

String ipv = '';
String brows = '';
String browsVersion = '';

void main() async {
  ipv = await Ipify.ipv4();
  print(ipv);
  final browser = Browser();
  print('${browser.browser} ${browser.version}');
  brows = browser.browser;
  browsVersion = browser.version;


  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData(),
      themeMode: ThemeMode.light,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Expanded(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  'Samay',
                  style: GoogleFonts.merriweather(
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: 350,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kAccentLightColor.withOpacity(0.2)),
                  padding: EdgeInsets.all(25),
                  child: Column(
                    children: [
                      Container(
                        height: 300,
                        width: 300,
                        child: Clock(),
                      ),
                      Container(
                        width: 350,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                              prefixIcon: Icon(Icons.person)),
                          cursorColor: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: 350,
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Password',
                            prefixIcon: Icon(Icons.lock),
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
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Theme(
                            data: ThemeData(
                              unselectedWidgetColor: Colors.grey, // Your color
                            ),
                            child: Checkbox(
                              checkColor: kAccentLightColor,
                              activeColor: kAccentLightColor,
                              focusColor: kAccentLightColor,
                              hoverColor: kAccentLightColor,
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            ),
                          ),
                          Text(
                            'Remember me',
                            style: GoogleFonts.merriweather(),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                            builder: (context) {
                              return Dashboard();
                            },
                          ), (route) => false);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 350,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kAccentLightColor),
                          child: Text(
                            'Login',
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
                SizedBox(height: 20),
                Text(
                  '2015 © Samay - The Complete Office',
                  style: GoogleFonts.merriweather(
                    fontSize: 10,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Automation System.',
                  style: GoogleFonts.merriweather(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

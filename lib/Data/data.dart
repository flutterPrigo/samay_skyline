import 'package:samay_skyline/class/Holiday.dart';
import '../class/Leave.dart';
import '../main.dart';
import '../class/User.dart';

final allUsers = <User>[
  User(
      emplyeeName: 'Emma',
      date: '04/06/2021',
      inTime: 37,
      outTime: 38,
      totalTime: 20,
      ipAdress: ipv,
      device: 'mac',
      browser: "$brows / $browsVersion"),
  User(
      emplyeeName: 'Watson',
      date: '25/06/2021',
      inTime: 50,
      outTime: 60,
      totalTime: 43,
      ipAdress: ipv,
      device: 'mac',
      browser: "$brows / $browsVersion"),
  User(
      emplyeeName: 'Inna',
      date: '10/06/2021',
      inTime: 12,
      outTime: 30,
      totalTime: 16,
      ipAdress: ipv,
      device: 'mac',
      browser: "$brows / $browsVersion"),
];

final allLeave = <Leave>[
  Leave(
    action: 'all',
    leavefrom: '03/06/2021',
    leaveto: '03/06/2021',
    leavetype: '03/06/2021',
    reason: 'Hospital',
    status: 'Approve',
    workingon: 'Not Assigned',
  ),
  Leave(
    action: 'all',
    leavefrom: '25/06/2021',
    leaveto: '12/05/2021',
    leavetype: '21/06/2021',
    reason: 'House',
    status: 'Pending',
    workingon: 'Not Assigned',
  ),
];

final allHoliday = <Holiday>[
  Holiday(
      action: 'all',
      date: '14/01/2021',
      name: 'Makar Sankranti',
      day: 'Thursday'),
  Holiday(action: 'all', date: '29/03/2021', name: 'Duleti', day: 'Monday'),
  Holiday(
      action: 'all', date: '22/08/2021', name: 'Rakshabandhan', day: 'Sunday'),
  Holiday(action: 'all', date: '30/08/2021', name: 'Janmasthmi', day: 'Monday'),
  Holiday(
      action: 'all',
      date: '19/09/2021',
      name: 'Ganesh Visarjan	',
      day: 'Sunday'),
];

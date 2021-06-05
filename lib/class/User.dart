class User {
  final String emplyeeName;
  final String date;
  final String browser;
  final String device;
  final int inTime;
  final int outTime;
  final int totalTime;
  String ipAdress;

   User({
    required this.browser,
    required this.device,
    required this.outTime,
    required this.totalTime,
    required this.ipAdress,
    required this.emplyeeName,
    required this.date,
    required this.inTime,
  });

  User copy({
    String? emplyeeName,
    String? date,
    String? browser,
    String? device,
    int? age,
    int? inTime,
    String? ipAdress,
    int? outTime,
    int? totalTime,

  }) =>
      User(
        emplyeeName: emplyeeName ?? this.emplyeeName,
        date: date ?? this.date,
        inTime: inTime ?? this.inTime,
        ipAdress: ipAdress ?? this.ipAdress,
        browser: browser ?? this.browser,
        device: device ?? this.device,
        outTime: outTime ?? this.outTime,
        totalTime: totalTime ?? this.totalTime,
      );


}

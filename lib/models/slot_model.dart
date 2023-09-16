import 'package:study_league/models/slot_timing_model.dart';

class SlotModel {
  String selectedDay;
  List<SlotTimingModel> morningTimings;
  List<SlotTimingModel> afternoonTimings;
  List<String> weekDays;

  SlotModel(
      {required this.selectedDay,
      required this.morningTimings,
      required this.afternoonTimings,
      required this.weekDays});

  factory SlotModel.fromJson(Map<String, dynamic> json) {
    return SlotModel(
      selectedDay: json['selectedDay'],
      morningTimings: List<SlotTimingModel>.from(
          json['morningTimings'].map((x) => SlotTimingModel.fromJson(x))),
      afternoonTimings: List<SlotTimingModel>.from(
          json['afternoonTimings'].map((x) => SlotTimingModel.fromJson(x))),
      weekDays: List<String>.from(json['weekDays']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'selectedDay': selectedDay,
      'morningTimings':
          List<dynamic>.from(morningTimings.map((x) => x.toJson())),
      'afternoonTimings':
          List<dynamic>.from(afternoonTimings.map((x) => x.toJson())),
      'weekDays': List<String>.from(weekDays),
    };
  }

  factory SlotModel.empty() {
    return SlotModel(selectedDay: 'Monday', morningTimings: [
      SlotTimingModel(timeTxt: '09:00\nAM', enable: false),
      SlotTimingModel(timeTxt: '9:30\nAM', enable: false),
      SlotTimingModel(timeTxt: '10:00\nAM', enable: false),
      SlotTimingModel(timeTxt: '10:30\nAM', enable: false),
    ], afternoonTimings: [
      SlotTimingModel(timeTxt: '11:00\nAM', enable: false),
      SlotTimingModel(timeTxt: '11:30\nAM', enable: false),
      SlotTimingModel(timeTxt: '12:00\nPM', enable: false),
      SlotTimingModel(timeTxt: '12:30\nPM', enable: false),
    ], weekDays: [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ]);
  }
}

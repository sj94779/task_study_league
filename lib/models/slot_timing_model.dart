class SlotTimingModel {
  String timeTxt;
  bool enable;

  SlotTimingModel({required this.timeTxt, required this.enable});

  factory SlotTimingModel.fromJson(Map<String, dynamic> json) {
    return SlotTimingModel(timeTxt: json['timeTxt'], enable: json['enable']);
  }

  Map<String, dynamic> toJson() {
    return {'timeTxt': timeTxt, 'enable': enable};
  }

  factory SlotTimingModel.empty() {
    return SlotTimingModel(timeTxt: '9:30\nAM', enable: true);
  }
}

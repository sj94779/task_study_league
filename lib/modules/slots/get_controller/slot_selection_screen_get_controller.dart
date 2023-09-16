import 'package:get/get.dart';
import '../../../models/slot_model.dart';
import '../../../models/slot_timing_model.dart';

class SlotSelectionScreenGetController extends GetxController
    with GetTickerProviderStateMixin {
  RxList<SlotModel> slotList = <SlotModel>[].obs;
  RxList<bool> enableController = <bool>[false, false, false, false].obs;

  void updatedMorningSlot(
      SlotModel selectedListItem, SlotTimingModel selectedSlot) {
    for (int i = 0; i < 4; i++) {
      if (selectedListItem.morningTimings[i].timeTxt == selectedSlot.timeTxt) {
        selectedSlot.enable = !selectedSlot.enable;
      }
    }
    for (int i = 0; i < slotList.length; i++) {
      if (slotList[i] == selectedListItem) {
        slotList[i] = SlotModel(
            selectedDay: selectedListItem.selectedDay,
            morningTimings: selectedListItem.morningTimings,
            afternoonTimings: selectedListItem.afternoonTimings,
            weekDays: selectedListItem.weekDays);
      }
    }
  }

  void updatedAfternoonSlot(
      SlotModel selectedListItem, SlotTimingModel selectedSlot) {
    for (int i = 0; i < 4; i++) {
      if (selectedListItem.afternoonTimings[i].timeTxt ==
          selectedSlot.timeTxt) {
        selectedSlot.enable = !selectedSlot.enable;
      }
    }
    for (int i = 0; i < slotList.length; i++) {
      if (slotList[i] == selectedListItem) {
        slotList[i] = SlotModel(
            selectedDay: selectedListItem.selectedDay,
            morningTimings: selectedListItem.morningTimings,
            afternoonTimings: selectedListItem.afternoonTimings,
            weekDays: selectedListItem.weekDays);
      }
    }
  }

  void fetchTeachersRatingList() {
    Future.delayed(const Duration(milliseconds: 500), () {
      slotList.add(SlotModel.empty());
    });
  }

  void addSlot() {
    slotList.add(SlotModel.empty());
  }

  void removeSlot(SlotModel selectedSlot) {
    slotList.remove(selectedSlot);
  }

  @override
  void onInit() {
    super.onInit();
    fetchTeachersRatingList();
  }
}

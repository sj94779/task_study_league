import 'package:get/get.dart';
import '../../../models/slot_model.dart';

class SlotSelectionScreenGetController extends GetxController
    with GetTickerProviderStateMixin {
  RxList<SlotModel> slotList = <SlotModel>[].obs;
  RxList<String> allSlots = <String>[].obs;

  SlotSelectionScreenGetController slotSelectionScreenGetController =
      Get.find<SlotSelectionScreenGetController>();

  void fetchAllSelectedSlots() {
    for (int i = 0; i < slotSelectionScreenGetController.slotList.length; i++) {
      for (int j = 0; j < 4; j++) {
        if (slotSelectionScreenGetController
                .slotList[i].morningTimings[j].enable ==
            true) {
          allSlots.add(slotSelectionScreenGetController
              .slotList[i].morningTimings[j].timeTxt);
        }
      }
    }
    for (int i = 0; i < slotSelectionScreenGetController.slotList.length; i++) {
      for (int j = 0; j < 4; j++) {
        if (slotSelectionScreenGetController
                .slotList[i].afternoonTimings[j].enable ==
            true) {
          allSlots.add(slotSelectionScreenGetController
              .slotList[i].morningTimings[j].timeTxt);
        }
      }
    }
  }

  @override
  void onInit() {
    fetchAllSelectedSlots();
    super.onInit();
  }
}

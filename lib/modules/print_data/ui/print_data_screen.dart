import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:study_league/widgets/text_with_format.dart';
import '../../core/app_colors.dart';
import '../../slots/get_controller/slot_selection_screen_get_controller.dart';

class PrintScreen extends StatelessWidget {
  const PrintScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SlotSelectionScreenGetController getController =
        Get.put(SlotSelectionScreenGetController());

  //  [{"day":"1","slot_array":["1","8"]},{"day":"2","slot_array":["2","7"]},{"day":"3","slot_array":["3","6"]},{"day":"4","slot_array":["2","3"]},{"day":"5","slot_array":["7","6"]},{"day":"6","slot_array":["3","6"]},{"day":"7","slot_array":["8"]}]

    return ColoredBox(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: const Color(0xFFaecdff).withOpacity(0.2),
        appBar: AppBar(
          backgroundColor: AppColors.blue,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 16,
                  ),

                  Obx(() {
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        // mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...getController.slotList
                              .map((element) =>
                              Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [

                                          Text(json.decode(jsonEncode(element.toJson().toString()))),
                                          const SizedBox(
                                            height: 10,
                                          ),

                                        ],
                                      ),
                                    ),
                                  ))
                              .toList()
                        ],
                      ),
                    );
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

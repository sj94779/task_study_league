import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../../../widgets/text_with_format.dart';
import '../../core/app_colors.dart';
import '../../print_data/ui/print_data_screen.dart';
import '../get_controller/slot_selection_screen_get_controller.dart';

class SlotSelectionScreen extends StatelessWidget {
  const SlotSelectionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SlotSelectionScreenGetController getController =
        Get.put(SlotSelectionScreenGetController());

    return ColoredBox(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: const Color(0xFFaecdff).withOpacity(0.2),
        appBar: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          title: const TextWithFormat(
            'Online Consultation Slots',
            color: AppColors.blue,
            bold: true,
          ),
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
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...getController.slotList
                              .map((element) => Card(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: Get.width / 2,
                                                child: DropdownButtonFormField(
                                                  items: element.weekDays
                                                      .map((e) =>
                                                          DropdownMenuItem(
                                                            value: e,
                                                            child: Text(e),
                                                          ))
                                                      .toList(),
                                                  //  value: element.selectedDay,
                                                  onChanged: (value) {
                                                    if (value != null) {
                                                      element.selectedDay =
                                                          value;
                                                    }
                                                  },
                                                  style: const TextStyle(
                                                    color: AppColors.blue,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                    fontStyle: FontStyle.normal,
                                                  ),
                                                  decoration:
                                                      const InputDecoration(
                                                          iconColor:
                                                              AppColors.blue,
                                                          border: UnderlineInputBorder(
                                                              borderSide: BorderSide(
                                                                  color: Colors
                                                                      .white)),
                                                          hintText:
                                                              'Select Day',
                                                          hintStyle: TextStyle(
                                                            color:
                                                                AppColors.blue,
                                                          )),
                                                  elevation: 8,
                                                  isExpanded: true,
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: AppColors.blue,
                                                ),
                                                onPressed: () {
                                                  if (getController
                                                          .slotList.length >
                                                      1) {
                                                    getController
                                                        .removeSlot(element);
                                                  }
                                                },
                                              )
                                            ],
                                          ),
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ...element.morningTimings
                                                      .map(
                                                        (element2) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              getController
                                                                  .updatedMorningSlot(
                                                                      element,
                                                                      element2);
                                                            },
                                                            child: Container(
                                                              height:
                                                                  Get.height /
                                                                      20,
                                                              width:
                                                                  Get.width / 6,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: element2.enable
                                                                          ? AppColors
                                                                              .blue
                                                                          : AppColors
                                                                              .white,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .black, //color of border
                                                                        width:
                                                                            2, //width of border
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                              child: Center(
                                                                child:
                                                                    TextWithFormat(
                                                                  element2
                                                                      .timeTxt,
                                                                  bold: true,
                                                                  color: element2.enable
                                                                      ? AppColors
                                                                          .white
                                                                      : AppColors
                                                                          .blue,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                      .toList()
                                                ]),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  ...element.afternoonTimings
                                                      .map(
                                                        (element2) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child:
                                                              GestureDetector(
                                                            onTap: () {
                                                              getController
                                                                  .updatedAfternoonSlot(
                                                                      element,
                                                                      element2);
                                                            },
                                                            child: Container(
                                                              height:
                                                                  Get.height /
                                                                      20,
                                                              width:
                                                                  Get.width / 6,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      color: element2.enable
                                                                          ? AppColors
                                                                              .blue
                                                                          : AppColors
                                                                              .white,
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
                                                                            .black, //color of border
                                                                        width:
                                                                            2, //width of border
                                                                      ),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5)),
                                                              child: Center(
                                                                child:
                                                                    TextWithFormat(
                                                                  element2
                                                                      .timeTxt,
                                                                  bold: true,
                                                                  color: element2.enable
                                                                      ? AppColors
                                                                          .white
                                                                      : AppColors
                                                                          .blue,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                      .toList()
                                                ]),
                                          ],
                                        ),
                                      ],
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
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Obx(() {
                      return Visibility(
                        visible: getController.slotList.length < 7,
                        child: InkWell(
                            onTap: () {
                              getController.addSlot();
                            },
                            child: const TextWithFormat(
                              'Add more ..',
                              color: AppColors.blue,
                            )),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: NeumorphicButton(
                style: const NeumorphicStyle(
                  color: AppColors.blue,
                  depth: 3,
                  intensity: 5,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    TextWithFormat(
                      'Save Information',
                      color: Colors.white,
                    ),
                  ],
                ),
                onPressed: () {
                  Get.to(
                      transition: Transition.cupertino,
                      () => const PrintScreen());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

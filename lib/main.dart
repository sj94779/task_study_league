import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:study_league/modules/slots/ui/slot_selection_screen.dart';

import 'modules/core/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Study League Task',
      theme: ThemeData(
        primarySwatch: AppColors.primary,

      ),
      home: const SlotSelectionScreen(),
    );
  }
}

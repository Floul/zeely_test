import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zeely_test/features/avatars_list_screen/services/mock_avatar_service.dart';
import 'package:zeely_test/services/avatar_service/avatar_service.dart';

import 'features/avatars_list_screen/controllers/avatar_filter_controller.dart';
import 'features/avatars_list_screen/screens/avatar_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _fontFamily = 'Italian Plate No2 Expanded';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Avatar Filter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        fontFamily: _fontFamily,
      ),
      onInit: () {
        Get.lazyPut<AvatarService>(() => MockAvatarService(), fenix: true);
        Get.put(AvatarFilterController());
      },
      home: const AvatarListScreen(),
    );
  }
}

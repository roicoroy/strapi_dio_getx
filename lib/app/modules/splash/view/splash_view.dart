import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../auth/controllers/auth_controller.dart';

class SplashView extends GetView<AuthController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        final AuthController controller = Get.find<AuthController>();
        return Center(
          child: Text(
            'Count: ${controller.count}',
            style: const TextStyle(fontSize: 20),
          ),
        );
      }),
      bottomNavigationBar: ElevatedButton(
        onPressed: () {
          final AuthController controller = Get.find<AuthController>();
          controller.increment();
        },
        child: Text('Increase Count'),
      ),
    );
  }
}

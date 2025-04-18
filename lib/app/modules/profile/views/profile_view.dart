import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../const.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PROFILE".tr), centerTitle: true),
      body: ListView(
        children: [
          const SizedBox(height: 20),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 36,
                    child: Image.network(
                      "${controller.profileImg.value}",
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Text(
                        controller.user.value?.email ??
                        "Sign in your account",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        controller.user.value?.username ??
                            "Sign in your account",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

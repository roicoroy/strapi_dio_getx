import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PROFILE".tr),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    child:
                        controller.profileImg.value != null
                            ? Image.network("${controller.profileImg.value}")
                            : Image.asset("assets/user_image.png"),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Wrap(
                        children: [
                          Text(
                            controller.user.value?.email ??
                                "Sign in your account",
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        controller.user.value?.username ??
                            "Sign in your account",
                      ),
                      ElevatedButton(
                        onPressed: () => {controller.changeAvatar()},
                        child: Text('change avatar'),
                      ),
                      ElevatedButton(
                        onPressed:
                            () => {
                              controller.uploadProfileImage(
                                controller.uploadFile,
                              ),
                            },
                        child: Text('upload'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50),
          Container(
            padding: EdgeInsets.all(5),
            child: Obx(
              () =>
                  controller.selectedImagePath!.value == ''
                      ? Text(
                        'Select an Image From Camera or Gallery',
                        style: TextStyle(fontSize: 20),
                      )
                      : Image.file(File(controller.selectedImagePath!.value)),
            ),
          ),
        ],
      ),
    );
  }
}

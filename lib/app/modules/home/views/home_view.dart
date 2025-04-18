import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        actions: [
          IconButton(
            icon: const Icon(Icons.code),
            onPressed: () {
              Get.toNamed(Routes.COW_LOGGER);
            },
          ),
          IconButton(
            icon: const Icon(Icons.looks_outlined),
            onPressed: () {
              Get.toNamed(Routes.PROFILE);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              controller.logout();
            },
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () =>
                    controller.selectedImagePath.value == ''
                        ? Text(
                          'Select an Image From Camera or Gallery',
                          style: TextStyle(fontSize: 20),
                        )
                        : Image.file(File(controller.selectedImagePath.value)),
              ),

              Obx(
                () => Text(
                  controller.selectedImageSize.value == ""
                      ? ''
                      : controller.selectedImageSize.value,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.getImage(ImageSource.camera);
                },
                child: Text('Camera'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.getImage(ImageSource.gallery);
                },
                child: Text('Gallery'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.pickFiles();
                },
                child: Text('Pick Files'),
              ),
              ElevatedButton(
                onPressed: () {
                  controller.uploadImage(controller.uploadFile);
                },
                child: Text('Upload Files'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

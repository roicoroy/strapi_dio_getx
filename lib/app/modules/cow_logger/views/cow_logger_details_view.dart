import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:strapi_dio_getx/app/model/cow_logger.dart';

import '../../../model/cow_logger.dart' as cow_logger;
import '../../../routes/app_pages.dart';
import '../controllers/cow_logger_details_controller.dart';

// ignore: must_be_immutable
class CowLoggerDetailsView extends GetView<CowLoggerDetailsController> {
  // final Datum? log;
  
  CowLoggerDetailsView({super.key, required log});

  cow_logger.Datum? log = Get.arguments['log'];

  @override
  Widget build(BuildContext context) {
    controller.setUpLog(log);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: ElevatedButton(
          onPressed:
              () => {
                Get.toNamed(Routes.COW_LOGGER, arguments: {'loadLogs': true}),
              },
          child: Text('back'),
        ),
      ),
      body: Card(
        child: Obx(() {
          if (controller.imagePath?.value != "") {
            return Center(
              // child: Image.network(height: 100, controller.imagePath!.value),
              child: SocialPictureGroup(
                title: controller.log?.name,
                description: controller.log?.description,
                color: Colors.orange,
                imgUrl: controller.imagePath!.value,
                width: 100,
                onTap: () {},
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(color: Colors.green),
            );
          }
        }),
      ),
    );
  }
}

class SocialPictureGroup extends StatelessWidget {
  const SocialPictureGroup({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.description,
    required this.color,
    required this.onTap,
    this.width = 400,
  }) : super(key: key);

  final String imgUrl;
  final String title;
  final String description;
  final Color color;
  final Function onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            onTap();
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(22)),
                    color: Colors.red,
                  ),
                  clipBehavior: Clip.antiAlias,
                  // child: Image.network(imgUrl, fit: BoxFit.fitWidth),
                ),
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

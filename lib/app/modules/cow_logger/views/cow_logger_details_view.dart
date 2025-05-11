import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as cup;
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:strapi_dio_getx/app/model/cow_logger.dart';

import '../../../model/cow_logger.dart' as cow_logger;
import '../../../routes/app_pages.dart';
import '../controllers/cow_logger_details_controller.dart';

// ignore: must_be_immutable
class CowLoggerDetailsView extends GetView<CowLoggerDetailsController> {
  const CowLoggerDetailsView(this.log, {super.key});
  final Datum? log;
  // cow_logger.Datum? log = Get.arguments['log'];

  @override
  Widget build(BuildContext context) {
    // controller.setUpLog(log);

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        title: const Text(''),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SafeArea(
                      child: Center(
                        child: SizedBox(
                          height: 150,
                          width: 150,
                          child: Hero(
                            tag: "${log!.id}",
                            child: cup.Image.network(log!.image!.url!),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      log!.name,
                      style: GoogleFonts.lexendDeca().copyWith(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "CowDetailsView",
                      style: GoogleFonts.quicksand().copyWith(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      "Desciption: ",
                      style: GoogleFonts.quicksand().copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      log!.description,
                      style: GoogleFonts.quicksand().copyWith(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Container(
          //   height: 180,
          //   decoration: const BoxDecoration(
          //     color: Colors.white,
          //     gradient: LinearGradient(
          //       begin: Alignment.center,
          //       end: Alignment.topCenter,
          //       colors: [Colors.white, Colors.white10],
          //     ),
          //   ),
          //   child: SafeArea(
          //     child: Padding(
          //       padding: const EdgeInsets.only(
          //         left: 30.0,
          //         right: 30.0,
          //         top: 50.0,
          //       ),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           ElevatedButton(
          //             onPressed: () {},
          //             style: ElevatedButton.styleFrom(
          //               backgroundColor: const Color(
          //                 0xffFEC449,
          //               ), // Background color
          //             ),
          //             child: SizedBox(
          //               height: 50,
          //               width: MediaQuery.sizeOf(context).width / 2,
          //               child: Center(
          //                 child: Text(
          //                   "Submit to log",
          //                   style: GoogleFonts.lexendDeca().copyWith(
          //                     color: Colors.black,
          //                     fontSize: 16,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
      bottomSheet: Container(
        height: 180,
        decoration: const BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            begin: Alignment.center,
            end: Alignment.topCenter,
            colors: [Colors.white, Colors.white10],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(
                      0xffFEC449,
                    ), // Background color
                  ),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.sizeOf(context).width / 2,
                    child: Center(
                      child: Text(
                        "Submit to log",
                        style: GoogleFonts.lexendDeca().copyWith(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    // return Scaffold(
    //   appBar: AppBar(
    //     automaticallyImplyLeading: false,
    //     leading: ElevatedButton(
    //       onPressed:
    //           () => {
    //             Get.toNamed(Routes.COW_LOGGER, arguments: {'loadLogs': true}),
    //           },
    //       child: Text('back'),
    //     ),
    //   ),
    //   body: Card(
    //     child: Obx(() {
    //       if (controller.imagePath?.value != "") {
    //         return Center(
    //           // child: Image.network(height: 100, controller.imagePath!.value),
    //           child: SocialPictureGroup(
    //             title: controller.log?.name,
    //             description: controller.log?.description,
    //             color: Colors.orange,
    //             imgUrl: controller.imagePath!.value,
    //             width: 100,
    //             onTap: () {},
    //           ),
    //         );
    //       } else {
    //         return Center(
    //           child: CircularProgressIndicator(color: Colors.green),
    //         );
    //       }
    //     }),
    //   ),
    // );
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

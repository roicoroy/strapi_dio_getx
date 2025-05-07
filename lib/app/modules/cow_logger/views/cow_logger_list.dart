import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:get/get.dart';

import '../../../../constants/app_assets.dart';
import '../../../model/door_hub/services_model.dart';
import '../../../routes/app_pages.dart';
import '../../widgets/buttons/custom_icon_button.dart';
import '../../widgets/containers/primary_container.dart';
import '../components/logger_grid_card.dart';
import '../components/logger_list_card.dart';
import 'logger_list.dart';
import '../controllers/cow_logger_controller.dart';

class CowLoggerList extends GetView<CowLoggerController> {
  CowLoggerList({super.key});

  bool isGridView = false;

  CowLoggerController crl = Get.put(CowLoggerController());

  @override
  Widget build(BuildContext context) {
    crl.getLogs();

    return Scaffold(
      appBar: AppBar(
        title: const Text('CowLoggerListView'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(onPressed: () => Get.toNamed(Routes.HOME)),
      ),
      // body: LoggerList(crl.list),
      body: Column(
        children: [
          SizedBox(height: 20.h),
          PrimaryContainer(
            child: AnimatedCrossFade(
              firstChild: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  // return LoggerList(controller.list.value);
                  return Slidable(
                    endActionPane: ActionPane(
                      extentRatio: 0.5,
                      motion: const ScrollMotion(),
                      children: [
                        SizedBox(width: 5.w),
                        CustomIconButton(icon: AppAssets.kDelete, onTap: () {}),
                      ],
                    ),

                    // child: LoggerList(controller.list.value),
                    child: LoggerListCard(
                      service: allServices[index],
                      log: controller.list.value[index],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: controller.list.value.length,
              ),
              secondChild: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 148.w / 237.h,
                  mainAxisSpacing: 10.w,
                  crossAxisSpacing: 10.w,
                ),
                itemCount: controller.list.value.length,
                itemBuilder: (context, index) {
                  // return LoggerGridCard(service: allServices[index]);
                  return LoggerList(crl.list);
                },
              ),
              crossFadeState:
                  isGridView
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 500),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
      // body: Obx(
      //   () => Column(
      //     children: [
      //       SizedBox(height: 20.h),
      //       PrimaryContainer(
      //         child: AnimatedCrossFade(
      //           firstChild: ListView.separated(
      //             shrinkWrap: true,
      //             physics: const NeverScrollableScrollPhysics(),
      //             itemBuilder: (context, index) {
      //               return Slidable(
      //                 endActionPane: ActionPane(
      //                   extentRatio: 0.5,
      //                   motion: const ScrollMotion(),
      //                   children: [
      //                     SizedBox(width: 5.w),
      //                     CustomIconButton(
      //                       icon: AppAssets.kDelete,
      //                       onTap: () {},
      //                     ),
      //                   ],
      //                 ),

      //                 child: LoggerList(controller.list.value),
      //                 // child: LoggerListCard(
      //                 //   service: allServices[index],
      //                 //   log: controller.list.value[index],
      //                 // ),
      //               );
      //             },
      //             separatorBuilder: (context, index) => const Divider(),
      //             itemCount: controller.list.value.length,
      //           ),
      //           secondChild: GridView.builder(
      //             shrinkWrap: true,
      //             physics: const NeverScrollableScrollPhysics(),
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               childAspectRatio: 148.w / 237.h,
      //               mainAxisSpacing: 10.w,
      //               crossAxisSpacing: 10.w,
      //             ),
      //             itemCount: controller.list.value.length,
      //             itemBuilder: (context, index) {
      //               // return LoggerGridCard(service: allServices[index]);
      //               return LoggerList(crl.list);
      //             },
      //           ),
      //           crossFadeState:
      //               isGridView
      //                   ? CrossFadeState.showSecond
      //                   : CrossFadeState.showFirst,
      //           duration: const Duration(milliseconds: 500),
      //         ),
      //       ),
      //       SizedBox(height: 20.h),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {controller.createNewLog()},
        tooltip: 'Add new log',
        child: Icon(Icons.add),
      ),
    );
  }
}

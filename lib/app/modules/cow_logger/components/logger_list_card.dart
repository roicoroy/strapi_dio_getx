import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mt;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart' show AppColors;
import '../../../../constants/app_typography.dart';
import '../../../model/cow_logger.dart';
import '../../../model/door_hub/services_model.dart';
import '../../../routes/app_pages.dart';
import '../controllers/cow_logger_controller.dart';
import '../views/cow_logger_details_view.dart';

class LoggerListCard extends StatelessWidget {
  final ServicesModel service;
  final Datum log;
  const LoggerListCard({super.key, required this.service, required this.log});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode(BuildContext context) =>
        Theme.of(context).brightness == Brightness.dark;

    const List<String> droplist = <String>['Edit', 'Delete'];

    final cowLoggerController = Get.put(CowLoggerController());

    return GestureDetector(
      onTap: () async {
        // Get.toNamed(Routes.COW_LOGGER_DETAILS, arguments: {'log': log});
        final result = await Navigator.of(context).push(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 700),
            reverseTransitionDuration: const Duration(milliseconds: 800),
            pageBuilder:
                (context, animation, secondaryAnimation) => FadeTransition(
                  opacity: animation,
                  // child: ProductDetailScreen(
                  //   // product: products[index],
                  //   onAddProduct: (product) {},
                  //   log: log,
                  // ),
                  child: CowLoggerDetailsView(log),
                ),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              return child;
            },
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        // height: 5,
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.25),
              ),
            ],
          ),
          child: SingleChildScrollView(
            child: Card(
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide.none,
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  children: [
                    DropdownButton<String>(
                      icon: const Icon(Icons.more_horiz),
                      elevation: 16,
                      style: const TextStyle(color: Colors.deepPurple),
                      underline: Container(
                        height: 2,
                        color: Colors.deepPurpleAccent,
                      ),
                      onChanged: (String? value) {
                        if (value == 'Edit') {
                          Get.toNamed(
                            Routes.COW_LOGGER_EDIT,
                            arguments: {'log': log},
                          );
                        } else {
                          // 'delete'
                          cowLoggerController.deleteLog(log.documentId);
                        }
                      },
                      items:
                          droplist.map<DropdownMenuItem<String>>((
                            String value,
                          ) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                              onTap: () => {},
                            );
                          }).toList(),
                    ),
                    SizedBox(
                      height: 100,
                      width: 140,
                      child: Hero(
                        tag: "${log.id}",
                        child: mt.Image.network(log.image!.url!),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(log.name, style: AppTypography.kMedium14),
                    SizedBox(height: 4.h),
                    Text(
                      log.description,
                      style: AppTypography.kLight12.copyWith(
                        color: AppColors.kNeutral04.withOpacity(0.75),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 4.5.h,
                        horizontal: 8.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.kLime,
                        borderRadius: BorderRadius.circular(5.r),
                      ),
                      child: Text(
                        '\$ ${log.date?.toIso8601String()}',
                        style: AppTypography.kMedium12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    // return Row(
    //   children: [
    //     Column(
    //       children: [
    //         GestureDetector(
    //           onTap: () async {
    //             // Get.toNamed(Routes.COW_LOGGER_DETAILS, arguments: {'log': log});
    //             final result = await Navigator.of(context).push(
    //               PageRouteBuilder(
    //                 transitionDuration: const Duration(milliseconds: 700),
    //                 reverseTransitionDuration: const Duration(
    //                   milliseconds: 800,
    //                 ),
    //                 pageBuilder:
    //                     (context, animation, secondaryAnimation) =>
    //                         FadeTransition(
    //                           opacity: animation,
    //                           // child: ProductDetailScreen(
    //                           //   // product: products[index],
    //                           //   onAddProduct: (product) {},
    //                           //   log: log,
    //                           // ),
    //                           child: CowLoggerDetailsView(log),
    //                         ),
    //                 transitionsBuilder: (
    //                   context,
    //                   animation,
    //                   secondaryAnimation,
    //                   child,
    //                 ) {
    //                   return child;
    //                 },
    //               ),
    //             );
    //           },
    //           child: Card(
    //             shape: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(15.r),
    //               borderSide: BorderSide.none,
    //             ),
    //             color: Colors.white,
    //             child: Padding(
    //               padding: const EdgeInsets.symmetric(vertical: 15.0),
    //               child: Column(
    //                 children: [
    //                   DropdownButton<String>(
    //                     icon: const Icon(Icons.more_horiz),
    //                     elevation: 16,
    //                     style: const TextStyle(color: Colors.deepPurple),
    //                     underline: Container(
    //                       height: 2,
    //                       color: Colors.deepPurpleAccent,
    //                     ),
    //                     onChanged: (String? value) {
    //                       if (value == 'Edit') {
    //                         Get.toNamed(
    //                           Routes.COW_LOGGER_EDIT,
    //                           arguments: {'log': log},
    //                         );
    //                       } else {
    //                         // 'delete'
    //                         cowLoggerController.deleteLog(log.documentId);
    //                       }
    //                     },
    //                     items:
    //                         droplist.map<DropdownMenuItem<String>>((
    //                           String value,
    //                         ) {
    //                           return DropdownMenuItem<String>(
    //                             value: value,
    //                             child: Text(value),
    //                             onTap: () => {},
    //                           );
    //                         }).toList(),
    //                   ),
    //                   SizedBox(
    //                     height: 100,
    //                     width: 140,
    //                     child: Hero(
    //                       tag: "${log.id}",
    //                       child: mt.Image.network(log.image!.url!),
    //                     ),
    //                   ),
    //                   SizedBox(height: 5.h),
    //                   Text(log.name, style: AppTypography.kMedium14),
    //                   SizedBox(height: 4.h),
    //                   Text(
    //                     log.description,
    //                     style: AppTypography.kLight12.copyWith(
    //                       color: AppColors.kNeutral04.withOpacity(0.75),
    //                     ),
    //                   ),
    //                   SizedBox(height: 8.h),
    //                   Container(
    //                     padding: EdgeInsets.symmetric(
    //                       vertical: 4.5.h,
    //                       horizontal: 8.w,
    //                     ),
    //                     decoration: BoxDecoration(
    //                       color: AppColors.kLime,
    //                       borderRadius: BorderRadius.circular(5.r),
    //                     ),
    //                     child: Text(
    //                       '\$ ${log.date?.toIso8601String()}',
    //                       style: AppTypography.kMedium12,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //     // const Spacer(),
    //     // Column(
    //     //   children: [
    //     //     DropdownButton<String>(
    //     //       icon: const Icon(Icons.more_horiz),
    //     //       elevation: 16,
    //     //       style: const TextStyle(color: Colors.deepPurple),
    //     //       underline: Container(height: 2, color: Colors.deepPurpleAccent),
    //     //       onChanged: (String? value) {
    //     //         if (value == 'Edit') {
    //     //           Get.toNamed(Routes.COW_LOGGER_EDIT, arguments: {'log': log});
    //     //         } else {
    //     //           // 'delete'
    //     //           cowLoggerController.deleteLog(log.documentId);
    //     //         }
    //     //       },
    //     //       items:
    //     //           droplist.map<DropdownMenuItem<String>>((String value) {
    //     //             return DropdownMenuItem<String>(
    //     //               value: value,
    //     //               child: Text(value),
    //     //               onTap: () => {},
    //     //             );
    //     //           }).toList(),
    //     //     ),
    //     //   ],
    //     // ),
    //   ],
    // );

    // return OpenContainer(
    //   transitionType: ContainerTransitionType.fadeThrough,
    //   openBuilder: (BuildContext _, VoidCallback openContainer) {
    //     return ProductDetailScreen(
    //       // product: products[index],
    //       onAddProduct: (product) {},
    //       log: log,
    //     );
    //     // final result = Navigator.of(context).push(
    //     //   PageRouteBuilder(
    //     //     transitionDuration: const Duration(milliseconds: 700),
    //     //     reverseTransitionDuration: const Duration(milliseconds: 800),
    //     //     pageBuilder:
    //     //         (context, animation, secondaryAnimation) => FadeTransition(
    //     //           opacity: animation,
    //     //           child: ProductDetailScreen(
    //     //             // product: products[index],
    //     //             onAddProduct: (product) {},
    //     //             log: log,
    //     //           ),
    //     //         ),
    //     //     transitionsBuilder: (
    //     //       context,
    //     //       animation,
    //     //       secondaryAnimation,
    //     //       child,
    //     //     ) {
    //     //       return child;
    //     //     },
    //     //   ),
    //     // );
    //     // return result;
    //     // return Column(
    //     //   mainAxisAlignment: MainAxisAlignment.start,
    //     //   crossAxisAlignment: CrossAxisAlignment.start,
    //     //   children: [
    //     //     Container(
    // decoration: BoxDecoration(
    //   color: Colors.white,
    //   shape: BoxShape.circle,
    //   boxShadow: [
    //     BoxShadow(
    //       offset: const Offset(12, 26),
    //       blurRadius: 50,
    //       spreadRadius: 0,
    //       color: Colors.grey.withOpacity(.25),
    //     ),
    //   ],
    // ),
    //     //       child: IconButton(
    //     //         icon: const Icon(Icons.arrow_back, color: Color(0xff4338CA)),
    //     //         onPressed: () {},
    //     //       ),
    //     //     ),
    //     //     const SizedBox(height: 10),
    //     //     const Text(
    //     //       "Order Details",
    //     //       style: TextStyle(
    //     //         color: Colors.black,
    //     //         fontSize: 30,
    //     //         fontWeight: FontWeight.bold,
    //     //       ),
    //     //     ),
    //     //   ],
    //     // );
    //     // return LoggerDetailView(services: service, log: log);
    //     // return CourseScreen(
    //     //   courseName: 'te',
    //     //   courseImage: AssetImage('assets/user_image.png'),
    //     //   courseInfo: 'll',
    //     //   coursePrice: '123',
    //     // );
    //   },
    //   middleColor:
    //       isDarkMode(context) ? AppColors.kDarkSurfaceColor : AppColors.kWhite,
    //   openColor:
    //       isDarkMode(context) ? AppColors.kDarkSurfaceColor : AppColors.kWhite,
    //   closedColor:
    //       isDarkMode(context) ? AppColors.kDarkSurfaceColor : AppColors.kWhite,

    //   closedShape: const RoundedRectangleBorder(),
    //   closedElevation: 0.0,
    //   closedBuilder: (BuildContext _, VoidCallback openContainer) {
    //     return Row(
    //       children: [
    //         SizedBox(
    //           height: 100,
    //           width: 140,
    //           child: Hero(
    //             tag: "${log.id}",
    //             // child: mt.Image.asset(
    //             //   products[index].imageUrl,
    //             // ),
    //             child: mt.Image.network(log.image!.url!),
    //           ),
    //         ),
    //         // Container(
    //         //   height: 116.h,
    //         //   width: 105.w,
    //         //   decoration: BoxDecoration(
    //         //     color: AppColors.kPrimary,
    //         //     borderRadius: BorderRadius.circular(30.r),
    //         //     border: Border.all(color: AppColors.kLine2),
    //         //     image: DecorationImage(
    //         //       image:
    //         //           log.image?.url != null
    //         //               ? NetworkImage(
    //         //                 log.image?.url ?? 'https://placehold.co/600x400',
    //         //               )
    //         //               : AssetImage('assets/user_image.png'),
    //         //       fit: BoxFit.cover,
    //         //     ),
    //         //   ),
    //         // ),
    //         SizedBox(width: 16.w),
    //         Expanded(
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Row(
    //                 children: [
    //                   const Spacer(),
    //                   DropdownButton<String>(
    //                     // value: dropdownValue,
    //                     icon: const Icon(Icons.more_horiz),
    //                     elevation: 16,
    //                     style: const TextStyle(color: Colors.deepPurple),
    //                     underline: Container(
    //                       height: 2,
    //                       color: Colors.deepPurpleAccent,
    //                     ),
    //                     onChanged: (String? value) {
    //                       if (value == 'Edit') {
    //                         Get.toNamed(
    //                           Routes.COW_LOGGER_EDIT,
    //                           arguments: {'log': log},
    //                         );
    //                       } else {
    //                         // 'delete'
    //                         cowLoggerController.deleteLog(log.documentId);
    //                       }
    //                     },
    //                     items:
    //                         droplist.map<DropdownMenuItem<String>>((
    //                           String value,
    //                         ) {
    //                           return DropdownMenuItem<String>(
    //                             value: value,
    //                             child: Text(value),
    //                             onTap: () => {},
    //                           );
    //                         }).toList(),
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(height: 5.h),
    //               Text(log.name, style: AppTypography.kMedium14),
    //               SizedBox(height: 4.h),
    //               Text(
    //                 log.description,
    //                 style: AppTypography.kLight12.copyWith(
    //                   color: AppColors.kNeutral04.withOpacity(0.75),
    //                 ),
    //               ),
    //               SizedBox(height: 8.h),
    //               Container(
    //                 padding: EdgeInsets.symmetric(
    //                   vertical: 4.5.h,
    //                   horizontal: 8.w,
    //                 ),
    //                 decoration: BoxDecoration(
    //                   color: AppColors.kLime,
    //                   borderRadius: BorderRadius.circular(5.r),
    //                 ),
    //                 child: Text(
    //                   '\$ ${log.date?.toIso8601String()}',
    //                   style: AppTypography.kMedium12,
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ],
    //     );
    //   },
    // );
  }
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../controllers/cow_logger_controller.dart';

class CowLoggerListView extends GetView<CowLoggerController> {
  const CowLoggerListView({super.key});

  @override
  CowLoggerController get controller => Get.find<CowLoggerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CowLoggerListView'), centerTitle: true),
      body: Obx(
        () => Center(
          child: ListView.builder(
            itemCount: controller.list.value.length,
            itemBuilder: (context, index) {
              final String? userName = controller.list.value[index].name;
              // return buildUserProfileWidget(userName, "RW", "assets/user_image.png");
              return ListTile(
                leading: Icon(Icons.insert_drive_file),
                title: Text(userName.toString()),
                onTap: () {
                  Get.toNamed(
                    Routes.COW_LOGGER_DETAILS,
                    arguments: {'log': controller.list.value[index]},
                  );
                },
              );
            //   return ListTile(
            //     leading: CircleAvatar(
            //       backgroundImage: NetworkImage(controller.list.value[index].image?.url ?? "https://via.placeholder.com/150"),
            //       radius: 24, // Adjust the size to fit within the list
            //     ),
            //     title: Text(controller.list.value[index].name ?? "blank"),
            //     subtitle: Text(controller.list.value[index].date?.toIso8601String() ?? "blank"),
            //     // Additional ListTile properties can be added here
            //   );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => {
              Get.toNamed(Routes.COW_LOGGER_DETAILS, arguments: {'log': null}),
            },
        tooltip: 'Add new log',
        child: Icon(Icons.add),
      ),
    );
  }
}

Widget buildUserProfileWidget(
  String? userName,
  String userInitials,
  String imageUrl,
) {
  return Column(
    children: <Widget>[
      CircleAvatar(
        radius: 50, // Adjust the radius for the size you want
        backgroundImage: imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
        backgroundColor: Colors.grey.shade200, // A default color for the avatar
        child: imageUrl.isEmpty ? Text(userInitials) : null,
      ),
      SizedBox(
        height: 8,
      ), // Provides some spacing between the avatar and the name
      Text(
        userName ?? "",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      // Additional user information can be added here
    ],
  );
}

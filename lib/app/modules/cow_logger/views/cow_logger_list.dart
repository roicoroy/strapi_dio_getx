import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/cow_logger_controller.dart';

class CowLoggerList extends GetView<CowLoggerController> {
  CowLoggerList({super.key});

  bool loadLogs = Get.arguments['loadLogs'];

  @override
  Widget build(BuildContext context) {
    controller.loadLogs(loadLogs);
    return Scaffold(
      appBar: AppBar(
        title: const Text('CowLoggerListView'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: BackButton(onPressed: () => Get.toNamed(Routes.HOME)),
      ),
      body: Obx(
        () => Center(
          child: ListView.builder(
            itemCount: controller.list.value.length,
            itemBuilder: (context, index) {
              final String? userName = controller.list.value[index].name;
              final DateTime? date = controller.list.value[index].date;
              return Padding(
                padding: EdgeInsets.all(10.0),
                child: CardFb1(
                  text: userName ?? "blank",
                  imageUrl: controller.list.value[index].image?.url,
                  subtitle: date!.toIso8601String(),
                  onPressed: () {
                    Get.toNamed(
                      Routes.COW_LOGGER_EDIT,
                      arguments: {'log': controller.list.value[index]},
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {controller.createNewLog()},
        tooltip: 'Add new log',
        child: Icon(Icons.add),
      ),
    );
  }
}

class CardFb1 extends StatelessWidget {
  final String text;
  final String? imageUrl;
  final String subtitle;
  final Function() onPressed;

  const CardFb1({
    required this.text,
    this.imageUrl,
    required this.subtitle,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 150,
        height: 150,
        padding: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.5),
          boxShadow: [
            BoxShadow(
              offset: const Offset(10, 20),
              blurRadius: 10,
              spreadRadius: 0,
              color: Colors.grey.withOpacity(.05),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 5),
            InkWell(
              onTap: onPressed,
              child: CircleAvatar(
                backgroundColor: Colors.amber,
                child:
                    imageUrl == null
                        ? Center(
                          child: CircularProgressIndicator(color: Colors.green),
                        )
                        : CircleAvatar(
                          backgroundColor: Colors.amber,
                          child: Image.network(
                            imageUrl!,
                            height: 59,
                            fit: BoxFit.cover,
                          ),
                        ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

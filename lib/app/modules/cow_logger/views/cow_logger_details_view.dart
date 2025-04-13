import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CowLoggerDetailsView extends GetView {
  CowLoggerDetailsView({super.key});
  
  String? id = Get.arguments['id'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CowLoggerDetailsView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CowLoggerDetailsView is working $id',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

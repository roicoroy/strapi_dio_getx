import 'package:flutter/material.dart';

class DatePickerService {
  DateTime selectedDate = DateTime.now();

  Future<DateTime> selectPickerDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: null,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
    return selectedDate;
  }
}

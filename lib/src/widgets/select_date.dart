import 'package:flutter/material.dart';

Future<DateTime?> selectDate(BuildContext context) async {
  DateTime date = DateTime.now();

  return await showDatePicker(
    context: context,
    initialDate: date,
    firstDate: date,
    lastDate: DateTime(date.year + 2),
  );
}

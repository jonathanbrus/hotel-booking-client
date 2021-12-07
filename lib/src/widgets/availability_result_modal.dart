import 'package:flutter/material.dart';

showAvailabilityResult(BuildContext context, String date, bool result) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      contentPadding: const EdgeInsets.all(0),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Icon(
              result ? Icons.check_circle_rounded : Icons.warning_rounded,
              size: 48,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
            child: Text(
              "SKV Mahal is ${result ? 'available' : 'not available'} for booking on $date",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}

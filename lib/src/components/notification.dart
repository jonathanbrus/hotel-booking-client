import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class AppNotifiation extends StatelessWidget {
  final DateTime timeStamp;
  final String title;
  final String message;
  final bool read;
  final String? imageUrl;
  final VoidCallback dismissed;

  const AppNotifiation({
    required this.timeStamp,
    required this.title,
    required this.message,
    required this.read,
    required this.dismissed,
    this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final date = DateFormat.yMMMEd().format(timeStamp);

    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      onDismissed: (DismissDirection direction) => dismissed(),
      background: Container(
        color: Theme.of(context).colorScheme.primary,
        padding: const EdgeInsets.only(right: 32),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete_forever_rounded,
          color: Colors.white,
          size: 28,
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.2),
              width: 1,
            ),
          ),
          color: read ? Colors.grey.withOpacity(0.2) : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                fontSize: width * 0.03,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              message,
              maxLines: 5,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                height: 1.6,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

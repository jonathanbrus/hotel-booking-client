import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth.dart';

class LogoutModal extends StatelessWidget {
  const LogoutModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 80,
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 2),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Icon(
              Icons.warning_rounded,
              color: Theme.of(context).colorScheme.onPrimary,
              size: 56,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 14,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Do you want to log out?",
                  style: TextStyle(
                    fontSize: 16.8,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    const SizedBox(width: 8),
                    Consumer<AuthProvider>(builder: (context, auth, ch) {
                      return TextButton(
                        onPressed: () {
                          Navigator.maybePop(context);
                          auth.setStatus(
                            AuthStatus.unAunthenticated,
                          );
                        },
                        child: const Text("Yes"),
                      );
                    }),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> showLogoutModal(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const LogoutModal(),
  );
}

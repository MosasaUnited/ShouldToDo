import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class ExitShowDialog extends StatelessWidget {
  const ExitShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Exit Confirmation'),
      icon: Icon(Icons.add_alert, color: Colors.amberAccent.shade700),
      content: const Text('Are you sure you want to exit ?'),
      actions: [
        TextButton(
          onPressed: () => GoRouter.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () => SystemNavigator.pop(),
          child: const Text('Exit'),
        ),
      ],
    );
  }
}

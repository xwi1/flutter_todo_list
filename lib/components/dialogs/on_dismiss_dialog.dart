import 'package:flutter/material.dart';

class OnDismissDialog extends StatelessWidget {
  const OnDismissDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('This todo will be deleted.'),
        actions: [
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(false), 
            child: const Text('No')
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true), 
            child: const Text('Yes')
          ),
        ],
      );
  }
}
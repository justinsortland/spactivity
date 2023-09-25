import 'package:SPACtivity/constants.dart';
import 'package:flutter/material.dart';

class MoreInfoDialogContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appVersion = '1.0.0'; 

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'SPACtivity',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Version $appVersion',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 16),
        Text(
          'Created by Justin Sortland (justinsortland2025@u.northwestern.edu)',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 16),
        Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: NorthwesternPurple,
              textStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            child: Text('Close'),
          ),
        ),
      ],
    );
  }
}
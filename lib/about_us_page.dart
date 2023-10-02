import 'package:flutter/material.dart';
import 'custom_app_bar.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext build) {
    return Scaffold(
      appBar: CustomAppBar(title: 'About Us'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'SPACtivity is an app created to serve as an unofficial app to help navigate the recreational athletic services offered at Northwestern. ',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'This is not an official NU app and isn''t affiliated with Northwestern University in any way.',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            Text(
              'If you have any suggestions or feedback, please e-mail me at justinsortland2025@u.northwestern.edu. Thanks!',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
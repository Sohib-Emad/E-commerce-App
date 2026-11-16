import 'package:eco/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Image(image: AssetImage('assets/icons/Buy.png')),
            Image(image: AssetImage('assets/icons/Notification.png')),
            Column(
              children: [
                Text(
                  "Delivery address",
                  style: AppStyles.homeheading1 as TextStyle,
                ),
                Text(
                  "Salatiga City, Central Java",
                  style: AppStyles.homeheading2 as TextStyle,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

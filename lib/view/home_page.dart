import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/profile.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

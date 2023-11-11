import 'package:SPACtivity/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'custom_app_bar.dart';
import 'gym.dart';

class GymEquipmentPage extends StatelessWidget {
  final Gym gym;

  GymEquipmentPage({required this.gym});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: gym.name),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Equipment',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: LighterPurple,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: gym.equipmentList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    gym.equipmentList[index].name,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
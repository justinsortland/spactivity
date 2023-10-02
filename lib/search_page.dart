import 'package:SPACtivity/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'equipment.dart';
import 'custom_app_bar.dart';
import 'equipment_detail_page.dart';
import 'favorite_equipment_notifier.dart';
import 'list_of_equipment.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final equipmentList = ListOfEquipment; 

  List<Equipment> filteredEquipmentList = [];
  final FavoriteEquipmentNotifier favoriteEquipmentNotifier = FavoriteEquipmentNotifier();

  @override
  void initState() {
    super.initState();
    filteredEquipmentList = equipmentList;
  }

  void filterEquipmentList(String query) {
    setState(() {
      filteredEquipmentList = equipmentList
        .where((equipment) => equipment.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    });
  }

  void handleEquipmentTap(Equipment equipment) async {
    final isOnDetailPage = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EquipmentDetailPage(
          equipment: equipment,
          onDetailPageChanged: (isOnDetailPage) {
            if (!isOnDetailPage) {
              setState(() {}); 
            }
          },
        ),
      ),
    );
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Search'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: filterEquipmentList,
              decoration: InputDecoration(
                hintText: 'Search gym equipment',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredEquipmentList.length,
              itemBuilder: (context, index) {
                final equipment = filteredEquipmentList[index];

                return GestureDetector(
                  onTap: () => handleEquipmentTap(equipment),
                  child: ListTile(
                    title: Text(
                      equipment.name,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),         
      bottomNavigationBar:  CustomBottomNavigationBar(currentIndex: 1, onTap: (index) {}),
    );
  }
}
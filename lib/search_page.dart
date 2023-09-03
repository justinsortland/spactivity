import 'package:SPACtivity/custom_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'equipment.dart';
import 'custom_app_bar.dart';
import 'equipment_detail_page.dart';
import 'favorite_equipment_notifier.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final List<Equipment> equipmentList = [
    Equipment(id: '0', name: '5 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '1', name: '10 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '2', name: '15 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '3', name: '20 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '4', name: '25 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '5', name: '30 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '6', name: '35 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '7', name: '40 lb Dummbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '8', name: '45 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '9', name: '50 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '10', name: '55 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '11', name: '60 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '12', name: '65 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '13', name: '70 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '14', name: '75 lb Dumbbells', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
    Equipment(id: '15', name: 'Treadmill', imageURL: 'https://picsum.photos/200', availableAtGyms: ['0']),
  ];

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
                    title: Text(equipment.name),
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
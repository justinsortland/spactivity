import 'package:provider/provider.dart';
import 'package:SPACtivity/constants.dart';
import 'package:SPACtivity/favorite_equipment_notifier.dart';
import 'package:flutter/material.dart';
import 'equipment.dart';
import 'gym.dart';

class EquipmentDetailPage extends StatefulWidget {
  final Equipment equipment; // Name of equipment
  final void Function(bool) onDetailPageChanged;

  EquipmentDetailPage({
    required this.equipment,
    required this.onDetailPageChanged,
  });

  @override
  _EquipmentDetailPageState createState() => _EquipmentDetailPageState();
}

class _EquipmentDetailPageState extends State<EquipmentDetailPage> {
  @override
  void initState() {
    super.initState();

    // Notify search page about detail page status
    widget.onDetailPageChanged(true);
  }

  @override
  void dispose() {
    // Notify search page that detail page is closed
    widget.onDetailPageChanged(false);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final initialInstructionsCount = 4;
    final allInstructions = widget.equipment.instructions;
    final initialInstructions = allInstructions.take(initialInstructionsCount).toList();

    // Access FavoriteEquipmentNotifier using Provider.of
    final favoriteEquipmentNotifier = Provider.of<FavoriteEquipmentNotifier>(context, listen: false);

    // Check if equipment is in favorite list
    final isFavorite = favoriteEquipmentNotifier.favoriteEquipment.contains(widget.equipment.id);

    // Function to handle favorite button tap
    void handleFavoriteButtonTap() {
      favoriteEquipmentNotifier.toggleFavorite(widget.equipment);
      setState(() {}); // Rebuild widget to reflect updated favorite status
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.equipment.name),
        backgroundColor: NorthwesternPurple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image of the equipment
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.equipment.imageURL),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Name of the equipment as a header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              widget.equipment.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Favorite button with heart icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: InkWell(
              onTap: handleFavoriteButtonTap,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: NorthwesternPurple,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isFavorite 
                        ? Icons.favorite 
                        : Icons.favorite_border, // Check if equipment is favorite
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      isFavorite 
                        ? 'Favorited' 
                        : 'Favorite',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Instructions of Use Section
          if (widget.equipment.isMachine) 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Text(
                    'Instructions of Use',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (widget.equipment.instructions.length >= 4)
                  Padding(
                    padding: EdgeInsets.only(left: 16.0, top: 16.0),
                    child: Text(
                      'Scroll down by pressing down on the text',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Container(
                    height: 200,
                    child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: widget.equipment.instructions.length,
                      itemBuilder: (context, index) {
                        final step = widget.equipment.instructions[index];
                        final parts = step.split(':');
                        if (parts.length == 2) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: parts[0].trim() + ': ',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: parts[1].trim(),
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),                                  
                                  ),
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              step.trim(),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          // "Available At" header
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16.0),
            child: Text(
              'Available At',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Gyms where equipment is available (initially empty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.equipment.availableAtGyms.map((gymID) {
              final gym = Provider.of<List<Gym>>(context).firstWhere((gym) => gym.id == gymID);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Container(
                  margin: EdgeInsets.only(left: 16.0),
                  child: Text(
                    gym.name,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
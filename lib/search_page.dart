import 'package:SPACtivity/constants.dart';
import 'package:SPACtivity/custom_bottom_navigation_bar.dart';
import 'package:flutter/foundation.dart';
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

  Set<String> selectedFilters = {};

  @override
  void initState() {
    super.initState();
    filteredEquipmentList = equipmentList;
    updateFilteredEquipment(selectedFilters);
  }

  @override
  void dispose() {
    FilterDropdownButton filterDropdownButton = FilterDropdownButton(
      equipmentList: ListOfEquipment,
      onFilterChanged: (Set<String> filters) {
      },
      selectedFilters: Set<String>(),
    );

    filterDropdownButton.onFilterChanged(Set());
    super.dispose();
  }

  void filterEquipmentList(String query) {
    setState(() {
      filteredEquipmentList = equipmentList
        .where((equipment) => equipment.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    });
  }

  void updateFilteredEquipment(Set<String> filters) {
    setState(() {
      selectedFilters = filters;

      if (selectedFilters != null && selectedFilters.isNotEmpty) {
        filteredEquipmentList = equipmentList
            .where((equipment) =>
                equipment.pushPull.any((filter) => selectedFilters.contains(filter)) ||
                equipment.legsBackChest.any((filter) => selectedFilters.contains(filter)))
            .toList();
      } else {
        filteredEquipmentList = List.of(equipmentList);
      }
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
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Search',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: LighterPurple,
                ),
              ),
            ),
          ),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FilterDropdownButton(
                equipmentList: equipmentList, 
                selectedFilters: selectedFilters,
                onFilterChanged: updateFilteredEquipment
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

class FilterDropdownButton extends StatefulWidget {
  final List<Equipment> equipmentList;
  final Set<String> selectedFilters;
  final ValueChanged<Set<String>> onFilterChanged;

  FilterDropdownButton({
    required this.equipmentList,
    required this.selectedFilters,
    required this.onFilterChanged,
  });

  @override
  _FilterDropdownButtonState createState() => _FilterDropdownButtonState();
}

class _FilterDropdownButtonState extends State<FilterDropdownButton>{
  Set<String> selectedFilters = Set();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            color: NorthwesternPurple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: PopupMenuButton<String>(
            icon: Icon(Icons.filter_list, color: Colors.white, size: 24),
            onSelected: (String value) {
              setState(() {
                selectedFilters.add(value);
                widget.onFilterChanged(selectedFilters);
              });
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: FilterCheckbox(
                    filter: 'Push',
                    isChecked: widget.selectedFilters.contains('Push'),
                    onChanged: (bool? value) {
                      if (value != null && value) {
                        selectedFilters.add('Push');
                      } else {
                        selectedFilters.remove('Push');
                      }
                      widget.onFilterChanged(selectedFilters.isNotEmpty ? selectedFilters : Set<String>());
                    },
                  ),
              ),
                PopupMenuItem(
                  child: FilterCheckbox(
                    filter: 'Pull',
                    isChecked: widget.selectedFilters.contains('Pull'),
                    onChanged: (bool? value) {
                      if (value != null && value) {
                        selectedFilters.add('Pull');
                      } else {
                        selectedFilters.remove('Pull');
                      }
                      widget.onFilterChanged(selectedFilters);
                    },
                  ),
                ),
                PopupMenuItem(
                  child: FilterCheckbox(
                    filter: 'Legs',
                    isChecked: widget.selectedFilters.contains('Legs'),
                    onChanged: (bool? value) {
                      if (value != null && value) {
                        selectedFilters.add('Legs');
                      } else {
                        selectedFilters.remove('Legs');
                      }
                      widget.onFilterChanged(selectedFilters);
                    },
                  ),
                ),
                PopupMenuItem(
                  child: FilterCheckbox(
                    filter: 'Back',
                    isChecked: widget.selectedFilters.contains('Back'),
                    onChanged: (bool? value) {
                      if (value != null && value) {
                        selectedFilters.add('Back');
                      } else {
                        selectedFilters.remove('Back');
                      }
                      widget.onFilterChanged(selectedFilters);
                    },
                  ),
                ),
                PopupMenuItem(
                  child: FilterCheckbox(
                    filter: 'Chest',
                    isChecked: widget.selectedFilters.contains('Chest'),
                    onChanged: (bool? value) {
                      if (value != null && value) {
                        selectedFilters.add('Chest');
                      } else {
                        selectedFilters.remove('Chest');
                      }
                      widget.onFilterChanged(selectedFilters);
                    },
                  ),
                ),
                PopupMenuItem(
                  child: FilterCheckbox(
                    filter: 'Core',
                    isChecked: widget.selectedFilters.contains('Core'),
                    onChanged: (bool? value) {
                      if (value != null && value) {
                        selectedFilters.add('Core');
                      } else {
                        selectedFilters.remove('Core');
                      }
                      widget.onFilterChanged(selectedFilters);
                    },
                  ),
                ),
                PopupMenuItem(
                  child: FilterCheckbox(
                    filter: 'Cardio',
                    isChecked: widget.selectedFilters.contains('Cardio'),
                    onChanged: (bool? value) {
                      if (value != null && value) {
                        selectedFilters.add('Cardio');
                      } else {
                        selectedFilters.remove('Cardio');
                      }
                      widget.onFilterChanged(selectedFilters);
                    },
                  ),
                ),
                PopupMenuItem(
                  child: FilterCheckbox(
                    filter: 'Full Body',
                    isChecked: widget.selectedFilters.contains('Full Body'),
                    onChanged: (bool? value) {
                      if (value != null && value) {
                        selectedFilters.add('Full Body');
                      } else {
                        selectedFilters.remove('Full Body');
                      }
                      widget.onFilterChanged(selectedFilters);
                    },
                  ),
                ),
                PopupMenuItem(
                  child: FilterCheckbox(
                    filter: 'Stability',
                    isChecked: widget.selectedFilters.contains('Stability'),
                    onChanged: (bool? value) {
                      if (value != null && value) {
                        selectedFilters.add('Stability');
                      } else {
                        selectedFilters.remove('Stability');
                      }
                      widget.onFilterChanged(selectedFilters);
                    },
                  ),
                ),
              ];
            },  
          ),
        ),
        SizedBox(height: 8),
        if (selectedFilters.isNotEmpty)
          GestureDetector(
            onTap: () {
              setState(() {
                selectedFilters.clear();
                widget.onFilterChanged(selectedFilters);
              });
            },
            child: Container(
              padding: EdgeInsets.only(left: 0, right: 0),
              child: Text(
                'Clear Filter',
                style: TextStyle(
                  color: LighterPurple,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    ); 
  }

  Set<String> updateFilters(String filter, bool? value) {
    final updatedFilters = Set<String>.from(widget.selectedFilters);

    if (value != null && value) {
      updatedFilters.add(filter);
    } else {
      updatedFilters.remove(filter);
    }

    return updatedFilters;
  }
}

class FilterCheckbox extends StatefulWidget {
  final String filter; 
  final bool isChecked;
  final ValueChanged<bool?> onChanged;

  FilterCheckbox({
    required this.filter, 
    required this.isChecked,
    required this.onChanged
  });

  @override
  _FilterCheckboxState createState() => _FilterCheckboxState();
}

class _FilterCheckboxState extends State<FilterCheckbox> {
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(
        widget.filter,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      value: isChecked,
      onChanged: (value) {
        setState(() {
          isChecked = value!;
        });
        widget.onChanged(value);
      },
    );
  }
}

  

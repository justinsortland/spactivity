class Equipment {
  final String id;
  final String name;
  final String imageURL;
  final List<String> availableAtGyms; // List of gym IDs
  final bool isMachine;
  final List<String> instructions;

  Equipment({
    required this.id, 
    required this.name, 
    required this.imageURL,
    required this.availableAtGyms,
    required this.isMachine,
    required this.instructions,
  });
}